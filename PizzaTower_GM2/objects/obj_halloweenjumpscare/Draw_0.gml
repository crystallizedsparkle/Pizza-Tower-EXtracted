if (!surface_exists(surface))
{
	surface = surface_create(surface_width, surface_height);
}
surface_set_target(surface);
draw_clear_alpha(c_black, 0);
draw_sprite_ext(sprite_index, image_index, x - surface_x, y - surface_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
surface_reset_target();
draw_surface(surface, surface_x, surface_y);
