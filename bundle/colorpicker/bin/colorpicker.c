//=====================================================================
// 拾取颜色并输出
// 返回值：
//   0 正常
//   1 被取消
//   2 语法错
//---------------------------------------------------------------------
#include<gtk/gtk.h>
#include<ctype.h>
//---------------------------------------------------------------------
/* 程序名称 */
char* self = NULL;

void usage(){
    printf("Colorpicker --- Pick color and print it\n\n"
           "Usage: %s [init_color]\n\n"
           "`init_color' should be in the form of #xxxxxx or rgba(r, g, b, a)\n"
           "If alpha is not 255, a `rgba' notation of the color is printed "
           "instead.\n"
           "If cancelled, nothing is printed and 1 is returned.\n\n"
           "by lilydjwg@gmail.com, 2010-08-16, ver 0.2\n"
           , self);
}
gint main(gint argc, gchar * argv[]){
    GtkWidget *colorseldlg;
    GdkColor color;
    GtkColorSelection *colorsel;
    gint response;
    gint r, g, b;
    guint16 alpha=65535;
    float f;

    self = argv[0];
    gtk_init(&argc, &argv);

    if(argc == 2){
        g = 0;
        b = 0;
        if(argv[1][0] == 'r'){
            if(argv[1][3] == 'a'){
                //rgba(...)
                sscanf(argv[1], "rgba(%d, %d, %d, %f)", &r, &g, &b, &f);
                color.red = r * 256;
                color.green = g * 256;
                color.blue = b * 256;
                alpha = f * 65535;
            }else if(argv[1][3] == '('){
                //rgb(...)
                sscanf(argv[1], "rgb(%d, %d, %d)", &r, &g, &b);
                color.red = r * 256;
                color.green = g * 256;
                color.blue = b * 256;
            }else{
                usage();
                return 2;
            }
            goto option_ok;
        }
        else if(argv[1][0] == '#'){
            b = 1;
        }
        for(r=b; r<b+6; r++){
            if(!isxdigit(argv[1][r])){
                usage();
                return 2;
            }
        }
        sscanf(argv[1], "#%2x%2x%2x", &r, &g, &b);
        color.red = r * 256;
        color.green = g * 256;
        color.blue = b * 256;
    }else if(argc == 1){
        color.red = 0xffff;
        color.green = 0xffff;
        color.blue = 0xffff;
    }else{
        usage();
        return 2;
    }

option_ok:
    colorseldlg = gtk_color_selection_dialog_new("Select color");
    colorsel = GTK_COLOR_SELECTION(GTK_COLOR_SELECTION_DIALOG(colorseldlg)->colorsel);
    gtk_color_selection_set_current_color(colorsel, &color);
    gtk_color_selection_set_has_palette(colorsel, TRUE);
    gtk_color_selection_set_has_opacity_control(colorsel, TRUE);
    gtk_color_selection_set_current_alpha(colorsel, alpha);
    gtk_window_set_position(GTK_WINDOW(colorseldlg), GTK_WIN_POS_MOUSE);
    gtk_window_set_keep_above(GTK_WINDOW(colorseldlg), TRUE);

    response = gtk_dialog_run(GTK_DIALOG(colorseldlg));
    if(response == GTK_RESPONSE_OK){
        gtk_color_selection_get_current_color(colorsel, &color);
        r = color.red / 256;
        g = color.green / 256;
        b = color.blue / 256;
        alpha = gtk_color_selection_get_current_alpha(colorsel);
        alpha /= 256;
        if(alpha == 255)
            printf("#%02x%02x%02x\n", r, g, b);
        else
            printf("rgba(%d, %d, %d, %.2f\n)", r, g, b, (float)alpha/256);
    }else
        /* 取消了 */
        return 1;

    return 0;
}
//=====================================================================
