draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, c_black, c_black, c_black, c_black, false);
draw_sprite(gerome_spr, gerome_index, gerome_x, gerome_y);
draw_sprite(spr_elevatorcliff, cliff_index, cliff_x, cliff_y);
shader_set(global.Pal_Shader);
var spr = spr_peppinoelevator;
if (!obj_player1.ispeppino)
{
	spr = spr_noiseelevator;
}
pattern_set(global.Base_Pattern_Color, spr, peppino_index, 1, 1, global.palettetexture);
pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
draw_sprite(spr, peppino_index, peppino_x, peppino_y);
pattern_reset();
shader_reset();
for (var i = 0; i < 10; i++)
{
	draw_sprite(spr_elevatorrope, 0, peppino_x, peppino_y - (sprite_get_height(spr_elevatorrope) * i));
}
