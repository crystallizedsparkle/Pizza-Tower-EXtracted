function scr_player_lungegrab()
{
	hsp = xscale * movespeed;
	vsp = 0;
	image_speed = 0.35;
	if (scr_solid(x + xscale, y) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
		if (_bump)
		{
			jumpstop = true;
			state = states.jump;
			vsp = -4;
			sprite_index = spr_suplexbump;
			instance_create(x + (xscale * 10), y + 10, obj_bumpeffect);
		}
	}
	if (ANIMATION_END)
	{
		state = states.normal;
	}
}
