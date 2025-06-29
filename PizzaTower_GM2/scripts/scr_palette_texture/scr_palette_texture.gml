function scr_palette_textureOLD()
{
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	gpu_set_blendenable(false);
	gpu_set_colorwriteenable(false, false, false, true);
	draw_set_alpha(0);
	draw_rectangle(cx, cy, cx + 960, cy + 540, false);
	draw_set_alpha(1);
	draw_sprite_ext(sprite, index, _x, _y, _xscale, _yscale, _angle, blend, 1);
	gpu_set_blendenable(true);
	gpu_set_colorwriteenable(true, true, true, true);
	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha); // not sure
	gpu_set_alphatestenable(true);
	var xs = sprite_get_width(sprite) / sprite_get_width(global.palettetexture);
	var ys = sprite_get_height(sprite) / sprite_get_height(global.palettetexture);
	var xx = _x;
	var yy = _y;
	draw_sprite_ext(global.palettetexture, 0, xx, yy, xs, ys, 0, blend, alpha);
	gpu_set_alphatestenable(false);
	if (!_gui)
	{
		gpu_set_blendmode(bm_normal);
	}
	else
	{
		reset_blendmode();
	}
}

function scr_get_texture_array()
{
	return
	[
		["funny", spr_peppattern1],
		["itchy", spr_peppattern2],
		["pizza", spr_peppattern3],
		["stripes", spr_peppattern4],
		["goldemanne", spr_peppattern5],
		["bones", spr_peppattern6],
		["pp", spr_peppattern7],
		["war", spr_peppattern8],
		["john", spr_peppattern9],
		["candy", spr_peppattern10],
		["bloodstained", spr_peppattern11],
		["bat", spr_peppattern12],
		["pumpkin", spr_peppattern13],
		["fur", spr_peppattern14],
		["flesh", spr_peppattern15],
		["racer", spr_noisepattern1],
		["comedian", spr_noisepattern2],
		["banana", spr_noisepattern3],
		["noiseTV", spr_noisepattern4],
		["madman", spr_noisepattern5],
		["bubbly", spr_noisepattern6],
		["welldone", spr_noisepattern7],
		["grannykisses", spr_noisepattern8],
		["towerguy", spr_noisepattern9]
	];
}

function scr_get_texture_palette(_pattern_name)
{
	var _arr = scr_get_texture_array();
	if (_pattern_name != "none")
	{
		for (var i = 0; i < array_length(_arr); i++)
		{
			if (_arr[i][0] == _pattern_name)
			{
				return _arr[i][1];
			}
		}
	}
	return noone;
}

function scr_get_texture_name(_patternspr)
{
	var _arr = scr_get_texture_array();
	if (_patternspr != noone)
	{
		for (var i = 0; i < array_length(_arr); i++)
		{
			if (_arr[i][1] == _patternspr)
			{
				return _arr[i][0];
			}
		}
	}
	return "none";
}

function scr_palette_texture(_spr, _imageindex, _x, _y, _xscale, _yscale, _rotation = 0, _color = c_white, _alpha = 1, _is_gui = false, _texture = noone)
{
	if (_texture == noone)
	{
		_texture = global.palettetexture;
	}
	if (_texture == noone)
	{
		exit;
	}
	if (event_type == ev_draw && event_number == 64)
	{
		_is_gui = true;
	}
	else
	{
		_is_gui = false;
	}
	if (shader_current() == global.Pal_Shader)
	{
		pal_swap_set(spr_peppalette, 1, false);
	}
	if (!surface_exists(global.palettesurface))
	{
		global.palettesurface = surface_create(960, 540);
	}
	if (!surface_exists(global.palettesurfaceclip))
	{
		global.palettesurfaceclip = surface_create(960, 540);
	}
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	if (_is_gui)
	{
		cx = 0;
		cy = 0;
	}
	surface_set_target(global.palettesurfaceclip);
	draw_clear_alpha(c_black, 0);
	draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, false);
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(_spr, _imageindex, _x - cx, _y - cy, _xscale, _yscale, _rotation, c_white, 1);
	if (_is_gui)
	{
		reset_blendmode();
	}
	else
	{
		gpu_set_blendmode(bm_normal);
	}
	surface_reset_target();
	surface_set_target(global.palettesurface);
	var sw = sprite_get_width(_spr);
	var sh = sprite_get_height(_spr);
	var xs = sw / sprite_get_width(_texture);
	var ys = sh / sprite_get_height(_texture);
	var xo = sprite_get_xoffset(_spr);
	var yo = sprite_get_yoffset(_spr);
	var xx = _x - cx - xo;
	var yy = _y - cy - yo;
	if (_xscale < 0)
	{
		xx = ((_x - cx) + xo) - sw;
	}
	if (_yscale < 0)
	{
		yy = ((_y - cy) + yo) - sh;
	}
	draw_sprite_ext(_texture, 0, xx, yy, xs + 4, ys + 4, 0, _color, 1);
	gpu_set_blendmode(bm_subtract);
	draw_surface(global.palettesurfaceclip, 0, 0);
	if (_is_gui)
	{
		reset_blendmode();
	}
	else
	{
		gpu_set_blendmode(bm_normal);
	}
	surface_reset_target();
	draw_surface_ext(global.palettesurface, cx, cy, 1, 1, 0, c_white, _alpha);
}
