if (room == rm_editor)
{
	exit;
}
if (sprite_index == spr_player_ratmountgameover && !gusrat)
{
	gusrat = true;
	with (create_debris(x, y, spr_ratblock_dead))
	{
		image_xscale = other.image_xscale;
		hsp = -image_xscale * 4;
		vsp = -8;
		image_angle = 0;
	}
}
if (state != states.grabbed && state != states.hit && (state != states.stun || (grounded && vsp > 0)))
{
	instance_destroy();
}
switch (state)
{
	case states.idle:
		scr_enemy_idle();
		break;
	case states.turn:
		scr_enemy_turn();
		break;
	case states.walk:
		scr_enemy_walk();
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
	case states.ghostpossess:
		scr_enemy_ghostpossess();
		break;
	case states.pizzaheadjump:
		scr_enemy_pizzaheadjump();
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
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
scr_scareenemy();
var player = instance_nearest(x, y, obj_player);
if (elite)
{
	var check = (image_xscale > 0) ? (player.x > x && player.x < (x + 200)) : (player.x < x && player.x > (x - 200));
	if (state == states.walk)
	{
		if (check && (y <= (player.y + 60) && y >= (player.y - 60)))
		{
			if (state != states.rage && ragebuffer == 0)
			{
				state = states.rage;
				sprite_index = ragespr;
				if (x != player.x)
				{
					image_xscale = -sign(x - player.x);
				}
				ragebuffer = 100;
				image_index = 0;
				image_speed = 0.5;
				flash = true;
				alarm[4] = 5;
				create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
			}
		}
	}
	if (ragebuffer > 0)
	{
		ragebuffer--;
	}
}
if (state != states.grabbed)
{
	depth = 0;
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
