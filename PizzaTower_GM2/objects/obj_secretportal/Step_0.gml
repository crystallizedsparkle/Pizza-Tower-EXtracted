image_speed = 0.35;
if (active)
{
	if (sprite_index == spr_secretportal_close && !touched)
	{
		sprite_index = spr_secretportal_open;
		image_index = 0;
	}
}
if (touched && sprite_index == spr_secretportal_close)
{
	with (playerid)
	{
		hsp = 0;
		vsp = 0;
		x = other.x;
		y = other.y;
		scale_xs = Approach(scale_xs, 0, 0.05);
		scale_ys = Approach(scale_ys, 0, 0.05);
		fallinganimation = 0;
		if (state == states.mach2 || state == states.mach3)
		{
			state = states.normal;
		}
	}
	with (obj_heatafterimage)
	{
		visible = false;
	}
}
if (ANIMATION_END)
{
	switch (sprite_index)
	{
		case spr_secretportal_open:
			sprite_index = spr_secretportal_idle;
			break;
		case spr_secretportal_close:
			image_index = image_number - 1;
			if (touched)
			{
				if (!instance_exists(obj_fadeout))
				{
					with (obj_player)
					{
						lastTargetDoor = targetDoor;
						targetDoor = "S";
						if (other.soundtest)
						{
							lastroom_soundtest = room;
							lastroom_secretportalID = other.id;
						}
						if (!other.secret)
						{
							lastroom = room;
							targetRoom = other.targetRoom;
							secretportalID = other.id;
						}
						else
						{
							targetRoom = lastroom;
							if (room == tower_soundtest || room == tower_soundtestlevel)
							{
								targetRoom = lastroom_soundtest;
								secretportalID = lastroom_secretportalID;
							}
						}
						with (obj_randomsecret)
						{
							if (!selected)
							{
								var len = array_length(levels);
								trace("Selecting random level, array length: ", len);
								if (len > 0)
								{
									var num = irandom(len - 1);
									selected_level = levels[num];
									selected = true;
									trace("Selected random level: ", room_get_name(selected_level));
									array_delete(levels, num, 1);
								}
							}
							if (selected_level != noone)
							{
								other.targetRoom = selected_level;
							}
						}
					}
					if (!secret && !soundtest && !instance_exists(obj_randomsecret))
					{
						ds_list_add(global.saveroom, id);
					}
					instance_create(x, y, obj_fadeout);
				}
			}
			break;
	}
}
