function scr_player_shoulder()
{
	move = key_left + key_right;
	if (grounded)
	{
		if (dir != xscale)
		{
			dir = xscale;
			movespeed = 2;
			facehurt = false;
		}
		jumpstop = false;
		anger = 100;
		if (!place_meeting(x, y + 1, obj_railparent))
		{
			hsp = move * movespeed;
		}
		else
		{
			var _railinst = instance_place(x, y + 1, obj_railparent);
			hsp = (move * movespeed) + (_railinst.movespeed * _railinst.dir);
		}
		if (move != 0)
		{
			if (movespeed < 7)
			{
				movespeed += 0.5;
			}
			else if (floor(movespeed) == 7)
			{
				movespeed = 7;
			}
		}
		else
		{
			movespeed = 0;
		}
		if (movespeed > 7)
		{
			movespeed -= 0.1;
		}
		if (move != 0)
		{
			if (movespeed < 3 && move != 0)
			{
				image_speed = 0.35;
			}
			else if (movespeed > 3 && movespeed < 6)
			{
				image_speed = 0.45;
			}
			else
			{
				image_speed = 0.6;
			}
		}
		else
		{
			image_speed = 0.35;
		}
	}
	if (!grounded)
	{
		if (momemtum == false)
		{
			hsp = move * movespeed;
		}
		else
		{
			hsp = xscale * movespeed;
		}
		if (move != xscale && momemtum == true && movespeed != 0)
		{
			movespeed -= 0.05;
		}
		if (movespeed == 0)
		{
			momemtum = false;
		}
		if ((move == 0 && momemtum == false) || scr_solid(x + hsp, y))
		{
			movespeed = 0;
			mach2 = 0;
		}
		if (move != 0 && movespeed < 7)
		{
			movespeed += 0.25;
		}
		if (movespeed > 7)
		{
			movespeed -= 0.05;
		}
		if ((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1))
		{
			movespeed = 0;
		}
		if (dir != xscale)
		{
			mach2 = 0;
			dir = xscale;
			movespeed = 0;
		}
		if (move == -xscale)
		{
			mach2 = 0;
			movespeed = 0;
			momemtum = false;
		}
		landAnim = true;
		if (!key_jump2 && jumpstop == false && vsp < 0.5 && stompAnim == false)
		{
			vsp /= 5;
			jumpstop = true;
		}
		if (ladderbuffer > 0)
		{
			ladderbuffer--;
		}
		if (scr_solid(x, y - 1) && jumpstop == false && jumpAnim == true)
		{
			vsp = grav;
			jumpstop = true;
		}
	}
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	if (ANIMATION_END)
	{
		state = states.normal;
	}
	image_speed = 0.35;
}
