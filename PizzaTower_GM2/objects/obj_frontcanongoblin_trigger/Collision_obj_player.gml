var _found = false;
with (obj_frontcanongoblin)
{
	if (state != states.gameover)
	{
		_found = true;
	}
}
if (!active && !_found)
{
	active = true;
	start = true;
	if (!instance_exists(obj_frontcanongoblin))
	{
		instance_create(x, y, obj_frontcanongoblin);
	}
	else
	{
		with (obj_frontcanongoblin)
		{
			destroyed = false;
			captain_sprite = 2196;
			state = states.normal;
		}
	}
	with (obj_frontcanongoblin_trigger)
	{
		active = true;
	}
}
else if (!start)
{
	with (obj_frontcanongoblin)
	{
		if (state != states.gameover && !destroyed)
		{
			destroyed = false;
			destroybuffer = 50;
			state = states.gameover;
			captain_sprite = spr_captaingoblin_end;
			canon_sprite = spr_captaingoblin_canon;
			captain_index = 0;
			alarm[0] = -1;
		}
	}
}
