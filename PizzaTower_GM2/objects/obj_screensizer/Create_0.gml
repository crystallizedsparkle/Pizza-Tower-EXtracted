enum aspectratios
{
	ratio_16_9 = 0,
	ratio_4_3 = 1,
}

#macro SCREEN_WIDTH obj_screensizer.actual_width
#macro SCREEN_HEIGHT obj_screensizer.actual_height

#macro CAM_WIDTH obj_screensizer.ideal_width
#macro CAM_HEIGHT obj_screensizer.ideal_height

global.resolutions[aspectratios.ratio_16_9] = [[480, 270], [960, 540], [1024, 576], [1280, 720], [1600, 900], [1920, 1080]];
global.resolutions[aspectratios.ratio_4_3] = [[640, 480], [800, 600], [1024, 768], [1152, 864], [1440, 1080]];
gameframe_init();
global.gameframe_caption_font = 0;
global.gameframe_caption_icon = spr_ico;
global.gameframe_caption_icon_margin = 6;
global.gameframe_border_width = 2;
lang_init = false;
captionalpha = 1;
dirty = true;
startbuffer = 10;
disappearbuffer = 100;
mouse_xprevious = mouse_x;
mouse_yprevious = mouse_y;
start_sound = false;
get_options();
aa_tex_size = shader_get_uniform(shd_aa, "texSize");
normal_size_fix_x = 0;
normal_size_fix_y = 0;
app_scale = 1;
display_width = display_get_width();
display_height = display_get_height();
aspect_ratio = aspectratios.ratio_16_9;
camzoom = 1;
savedwidth = window_get_width();
savedheight = window_get_height();
saved_guiwidth = display_get_gui_width();
saved_guiheight = display_get_gui_height();
gui_surf = noone;
ideal_width = get_resolution_width(1, aspect_ratio);
ideal_height = get_resolution_height(1, aspect_ratio);
actual_width = ideal_width;
actual_height = ideal_height;
window_width_current = 0;
window_height_current = 0;
last_scale_mode = global.option_scale_mode;
last_fullscreen = false;
alarm[1] = 1;
application_surface_draw_enable(false);
display_set_gui_size(CAM_WIDTH, CAM_HEIGHT);
screen_apply_size();
