if (room == rm_editor)
{
	exit;
}
switch (state)
{
	case states.idle:
		scr_enemy_idle();
		break;
	case states.charge:
		scr_enemy_charge();
		break;
	case states.turn:
		scr_enemy_turn();
		break;
	case states.walk:
		scr_enemy_walk();
		if (!instance_exists(coneID))
		{
			coneID = instance_create(x, y, obj_patrolcone);
			coneID.xoffset = 24;
			coneID.baddieID = id;
		}
		if (alarm[5] != -1)
		{
			hsp = 0;
		}
		break;
	case states.land:
		scr_enemy_land();
		break;
	case states.hit:
		scr_enemy_hit();
		break;
	case states.stun:
		scr_enemy_stun();
		break;
	case states.pizzagoblinthrow:
		scr_pizzagoblin_throw();
		break;
	case states.grabbed:
		scr_enemy_grabbed();
		break;
	case states.pummel:
		scr_enemy_pummel();
		break;
	case states.staggered:
		scr_enemy_staggered();
		break;
	case states.rage:
		scr_enemy_rage();
		break;
}
if (state == states.stun && stunned > 100 && birdcreated == false)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
	{
		ID = other.id;
	}
}
if (state != states.stun)
{
	birdcreated = false;
}
if (state == states.walk && y > ystart && !scr_solid(x, y - 1))
{
	y--;
}
if (state == states.walk && y < ystart && !scr_solid(x, y + 1))
{
	y++;
}
if (state == states.stun)
{
	grav = 0.5;
}
else
{
	grav = 0;
}
if (cooldown > 0)
{
	cooldown--;
}
if (state == states.walk)
{
	if (!patrolfound)
	{
		if (!instance_exists(obj_jumpscare) && cooldown <= 0 && alarm[5] == -1 && instance_exists(coneID) && coneID.collision)
		{
			patroltimer = patroltimermax;
			patrolfound = true;
			alarm[5] = 30;
		}
	}
	else if (alarm[5] == -1)
	{
		alarm[5] = 30;
	}
}
else if (state == states.stun || state == states.grabbed || state == states.hit)
{
	alarm[5] = -1;
}
if (instance_exists(obj_jumpscare))
{
	patrolfound = false;
	alarm[5] = -1;
}
if (state == states.walk && point_in_camera(x, y, view_camera[0]))
{
	var p = false;
	with (obj_player)
	{
		if (state == states.backbreaker && sprite_index == spr_taunt)
		{
			p = true;
		}
	}
	if (!p)
	{
		with (obj_swapmodefollow)
		{
			if (taunttimer > 0)
			{
				p = true;
			}
		}
	}
	if (p && (alarm[5] == -1 || patroltimer > 0))
	{
		patroltimer = 0;
		alarm[5] = -1;
		event_perform(ev_alarm, 5);
	}
}
if (state == states.punch)
{
	hsp = 0;
	if (ANIMATION_END)
	{
		state = states.walk;
		sprite_index = walkspr;
		cooldown = 100;
	}
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
if (state != states.grabbed)
{
	depth = 0;
}
if (state == states.stun || state == states.walk)
{
	movespeed = 0;
}
if (state != states.stun)
{
	thrown = false;
}
if (boundbox == false)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index;
		mask_index = other.sprite_index;
		baddieID = other.id;
		other.boundbox = true;
	}
}
