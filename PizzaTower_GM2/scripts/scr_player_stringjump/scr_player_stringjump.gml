function scr_player_stringjump()
{
	hsp = xscale * movespeed;
	move = key_left + key_right;
	if (move != 0)
	{
		if (xscale != move)
		{
			if (movespeed > 0)
			{
				movespeed = Approach(movespeed, 0, 0.5);
			}
			else
			{
				xscale = move;
				movespeed = 0;
			}
		}
		else if (movespeed < 8)
		{
			movespeed = Approach(movespeed, 8, 0.25);
		}
	}
	if (place_meeting(x + sign(hsp), y, obj_solid))
	{
		movespeed = 0;
	}
	if (grounded && vsp > 0)
	{
		state = states.normal;
		landAnim = true;
		sprite_index = spr_land;
		create_particle(x, y, particletypes.landcloud, 0);
	}
}

function scr_player_stringfall()
{
	if (instance_exists(stringid))
	{
		sprite_index = spr_mrpinch;
		hsp = movespeed;
		move = key_left + key_right;
		if (grounded && stringid.x != x)
		{
			var old_x = x;
			var old_y = y;
			var dir = sign(stringid.x - x);
			var i = 0;
			while (true)
			{
				x += dir;
				if (!scr_solid(x, y + 2))
				{
					y += 2;
					break;
				}
				i++;
				if (i > 5)
				{
					x = old_x;
					y = old_y;
					break;
				}
			}
		}
		if (move == 0 || grounded)
		{
			movespeed = Approach(movespeed, 0, 0.1);
		}
		else
		{
			movespeed = Approach(movespeed, move * 4, 0.25);
		}
		if (abs(movespeed) > 12)
		{
			movespeed = Approach(movespeed, 0, movespeeddeccel);
		}
	}
	hsp = movespeed;
}
