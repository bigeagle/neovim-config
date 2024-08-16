local function hex2rgb(color)
    color = string.lower(color)

    return {
        tonumber(color:sub(2, 3), 16),
        tonumber(color:sub(4, 5), 16),
        tonumber(color:sub(6, 7), 16),
    }
end

local function blend(fg, bg, alpha)
    local bg_rgb = hex2rgb(bg)
    local fg_rgb = hex2rgb(fg)

    local blend_channel = function(i)
        local ret = (alpha * fg_rgb[i] + ((1 - alpha) * bg_rgb[i]))

        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return ("#%02x%02x%02x"):format(blend_channel(1), blend_channel(2), blend_channel(3))
end

local function darken(color, amount)
	return blend("#000000", color, amount)
end

local function lighten(color, alpha)
    return blend(color, "#ffffff", alpha)
end

local function desaturate(color, alpha)
	local rgb = hex2rgb(color)
	local avg = (rgb[1] + rgb[2] + rgb[3]) / 3

	return blend(("#%02x%02x%02x"):format(avg, avg, avg), color, alpha)
end


return {
	"cpea2506/one_monokai.nvim",
    config = function ()
		require("one_monokai").setup({
			transparent = true,
			italics = true,
			themes = function()
				local colors = require "one_monokai.colors"
				return {
					Pmenu = { bg = colors.bg },
					DiagnosticError = { fg = blend(desaturate(colors.red, 0.2),	colors.bg, 0.5) },
					-- NormalFloat = { fg = colors.pink },
					-- FloatBorder = { fg = colors.pink },
				}
			end
		})
    end
}
