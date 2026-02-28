--- Tmux terminal provider for Claude Code.
-- This provider creates tmux panes to run Claude Code in external tmux sessions.

--- @type TerminalProvider
local M = {
  logger = nil
}

local active_pane_id = nil

local function is_in_tmux()
  return vim and vim.env and vim.env.TMUX ~= nil
end

local function get_tmux_pane_width()
  local handle = io.popen("tmux display-message -p '#{window_width}'")
  if not handle then
    return 80
  end
  local result = handle:read("*a")
  handle:close()
  local cleaned = result and result:gsub("%s+", "") or ""
  return tonumber(cleaned) or 80
end

local function calculate_split_size(percentage)
  if not percentage or percentage <= 0 or percentage >= 1 then
    return nil
  end

  local window_width = get_tmux_pane_width()
  return math.floor(window_width * percentage)
end

local function build_split_command(cmd_string, env_table, effective_config)
  local split_cmd = "tmux split-window"

  if effective_config.split_side == "left" then
    split_cmd = split_cmd .. " -bh"
  else
    split_cmd = split_cmd .. " -h"
  end

  local split_size = calculate_split_size(effective_config.split_width_percentage)
  if split_size then
    split_cmd = split_cmd .. " -l " .. split_size
  end

  -- Add environment variables
  if env_table then
    for key, value in pairs(env_table) do
      -- only pass CLAUDE_CODE_SSE_PORT to the tmux pane
      if key == "CLAUDE_CODE_SSE_PORT" then
        value = tostring(value)
        split_cmd = split_cmd .. " -e '" .. key .. "=" .. value .. "'"
      end
    end
  end

  split_cmd = split_cmd .. " '" .. cmd_string .. "'"

  return split_cmd
end

local function get_active_pane_id()
  -- vim.notify("Getting active pane ID: " .. tostring(active_pane_id))

  if not active_pane_id then
    return nil
  end

  local handle = io.popen("tmux list-panes -F '#{pane_id}' | grep '" .. active_pane_id .. "'")
  if not handle then
    return nil
  end

  local result = handle:read("*a")
  handle:close()

  -- vim.notify("Checking active pane ID: " .. tostring(result) .. " against " .. tostring(active_pane_id))

  if result and result:gsub("%s+", "") == active_pane_id then
    return active_pane_id
  end

  active_pane_id = nil
  return nil
end

local function capture_new_pane_id(split_cmd)
  local full_cmd = split_cmd .. " \\; display-message -p '#{pane_id}'"
  local handle = io.popen(full_cmd)
  if not handle then
    return nil
  end

  local result = handle:read("*a")
  handle:close()

  local pane_id = result:gsub("%s+", ""):match("%%(%d+)")
  return pane_id and ("%" .. pane_id) or nil
end

function M.setup(term_config)
  M.logger = require("claudecode.logger")
  if not is_in_tmux() then
    M.logger.warn("terminal", "Tmux provider configured but not running in tmux session")
    return
  end

  M.logger.debug("terminal", "Tmux terminal provider configured")
end

function M.open(cmd_string, env_table, effective_config, focus)
  if not is_in_tmux() then
    M.logger.error("terminal", "Cannot open tmux pane - not in tmux session")
    return
  end

  if get_active_pane_id() then
    M.logger.debug("terminal", "Claude tmux pane already exists, focusing existing pane")
    if focus ~= false then
      vim.fn.system("tmux select-pane -t " .. active_pane_id)
    end
    return
  end

  local split_cmd = build_split_command(cmd_string, env_table, effective_config)

  local new_pane_id = capture_new_pane_id(split_cmd)
  if new_pane_id then
    active_pane_id = new_pane_id
    -- vim.notify("Opening tmux pane with command: " .. tostring(split_cmd))
    M.logger.debug("terminal", "Created tmux pane with ID: " .. active_pane_id)

    if focus == false then
      vim.fn.system("tmux last-pane")
    end
  else
    M.logger.error("terminal", "Failed to create tmux pane")
  end
end

function M.close()
  local pane_id = get_active_pane_id()
  if not pane_id then
    M.logger.debug("terminal", "No active Claude tmux pane to close")
    return
  end

  vim.fn.system("tmux kill-pane -t " .. pane_id)
  active_pane_id = nil
  M.logger.debug("terminal", "Closed tmux pane: " .. pane_id)
end

function M.simple_toggle(cmd_string, env_table, effective_config)
  local pane_id = get_active_pane_id()
  if pane_id then
    M.close()
  else
    M.open(cmd_string, env_table, effective_config, true)
  end
end

function M.focus_toggle(cmd_string, env_table, effective_config)
  local pane_id = get_active_pane_id()
  if not pane_id then
    M.open(cmd_string, env_table, effective_config, true)
    return
  end

  vim.fn.system("tmux select-pane -t " .. pane_id)
end

function M.toggle(cmd_string, env_table, effective_config)
  M.simple_toggle(cmd_string, env_table, effective_config)
end

function M.get_active_bufnr()
  return nil
end

function M.is_available()
  return is_in_tmux()
end

function M._get_terminal_for_test()
  return {
    pane_id = active_pane_id,
    is_in_tmux = is_in_tmux(),
  }
end


return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  opts = {
    terminal_cmd = "klaude", -- Point to local installation
    terminal = {
      provider = M,
    },
  },
  keys = {
    { "<leader>c", nil, desc = "AI/Claude Code" },
    { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>cr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>cC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>cb",
      function()
        vim.cmd("ClaudeCodeAdd %")
        vim.defer_fn(function() vim.cmd("ClaudeCodeFocus") end, 50)
      end,
      desc = "Add current buffer" },
    { "<leader>cs",
      function()
        vim.cmd("ClaudeCodeSend")
        vim.defer_fn(function() vim.cmd("ClaudeCodeFocus") end, 50)
      end,
      mode = "v", desc = "Send to Claude" },
    {
      "<leader>cs",
      function()
        vim.cmd("ClaudeCodeSend")
        vim.defer_fn(function() vim.cmd("ClaudeCodeFocus") end, 50)
      end,
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
    },
    -- Diff management
    { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  },
}
