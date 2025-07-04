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
	case states.rage:
		scr_enemy_rage();
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
scr_scareenemy();
if (bombreset > 0)
{
	bombreset--;
}
var player = instance_nearest(x, y, obj_player);
if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)))
{
	if (bombreset <= 0)
	{
		if (state == states.walk)
		{
			if (x != player.x)
			{
				image_xscale = -sign(x - player.x);
			}
			image_index = 0;
			state = states.pizzagoblinthrow;
		}
	}
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}
if (ANIMATION_END && sprite_index == spr_spitcheese_spit)
{
	sprite_index = spr_spitcheese_idle;
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
