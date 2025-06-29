image_speed = 0.35;
switch (state)
{
	case states.monsteridle:
		sprite_index = spr_introidle;
		image_speed = 0.35;
		break;
	case states.monsterintro:
		if (sprite_index != spr_intro)
		{
			sprite_index = spr_intro;
			image_index = 0;
		}
		if (ANIMATION_END)
		{
			state = states.monsterchase;
		}
		break;
	case states.monsterwalk:
		sprite_index = spr_monstertomato_idle;
		x = camera_get_view_x(view_camera[0]) + (SCREEN_WIDTH / 2);
		y = camera_get_view_y(view_camera[0]) + yy;
		switch (substate)
		{
			case states.fall:
				yy += 2;
				if (yy > 440)
				{
					var pid = scr_puppet_detect();
					trace(pid);
					if (pid != noone)
					{
						playerid = pid;
						substate = states.chase;
					}
					else
					{
						substate = states.jump;
					}
				}
				break;
			case states.jump:
				yy -= 3;
				if (yy < -100)
				{
					destroy = false;
					with (obj_monstertrackingrooms)
					{
						sound_buffer = 0;
						monster_pos[other.monsterid].x = last_puppet_pos.x;
						monster_pos[other.monsterid].y = last_puppet_pos.y;
					}
					state = states.monsteridle;
				}
				break;
			case states.chase:
				yy -= 10;
				if (yy < -100)
				{
					scr_puppet_appear(playerid);
				}
				break;
		}
		break;
	case states.monsterchase:
		playerid = obj_player1.id;
		sprite_index = spr_monstertomato_chase;
		var dir = point_direction(x, y, playerid.x, playerid.y);
		if (!(x > (playerid.x - 8) && x < (playerid.x + 8) && y > (playerid.y - 8) && y < (playerid.y + 8)))
		{
			x += lengthdir_x(6, dir);
			y += lengthdir_y(6, dir);
		}
		if (x != playerid.x)
		{
			image_xscale = sign(playerid.x - x);
		}
		break;
}
if (state != states.monsteridle)
{
	inactivebuffer = 900;
}
if (state == states.monsterchase)
{
	if (!fmod_event_instance_is_playing(snd))
	{
		fmod_event_instance_play(snd);
	}
	fmod_event_instance_set_3d_attributes(snd, x, y);
}
else
{
	fmod_event_instance_stop(snd, true);
}
if (state == states.monsterchase)
{
	depth = -100;
}
