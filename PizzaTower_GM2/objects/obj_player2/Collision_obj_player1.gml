if (other.cutscene == false && other.state != states.actor && state != states.actor && other.state != states.gotoplayer && state != states.gotoplayer)
{
	if (hurted == false && other.hurted == false && fightballadvantage == true && (state == states.handstandjump || state == states.punch) && (other.state == states.handstandjump || other.state == states.punch))
	{
		if (object_index == obj_player1)
		{
			obj_player1.state = states.mach3;
			obj_player2.state = states.grabbed;
			obj_player2.xscale = xscale;
			obj_player1.depth = -7;
			obj_player2.depth = -6;
		}
		if (object_index == obj_player2)
		{
			obj_player2.state = states.mach3;
			obj_player1.state = states.grabbed;
			obj_player1.xscale = xscale;
			obj_player1.depth = -6;
			obj_player2.depth = -7;
		}
		obj_player1.image_index = 0;
		obj_player2.image_index = 0;
		obj_player1.sprite_index = obj_player1.spr_fightball;
		obj_player2.sprite_index = obj_player2.spr_fightball;
		obj_player1.fightball = true;
		obj_player2.fightball = true;
	}
	with (obj_player1)
	{
		if (state == states.handstandjump && other.hurted == false && other.state != states.hurt && other.state != states.knightpepslopes && other.state != states.knightpep && other.state != states.tumble && other.state != states.fireass && other.state != states.bombpep && other.cutscene == false && other.hurted == false && hurted == false && !(other.state == states.handstandjump || other.state == states.punch))
		{
			movespeed = 0;
			image_index = 0;
			sprite_index = spr_haulingstart;
			baddiegrabbedID = other.id;
			state = states.grab;
			other.state = states.grabbed;
			obj_player1.depth = -7;
			obj_player2.depth = -6;
		}
		if (state == states.freefall && other.hurted == false && other.state != states.stunned && other.state != states.hurt && hurted == false)
		{
			obj_player1.depth = -7;
			obj_player2.depth = -6;
			obj_player2.state = states.stunned;
			obj_player2.sprite_index = obj_player2.spr_squished;
			obj_player2.image_index = 0;
		}
		if (other.state == states.punch && hurted == false && other.hurted == false && !(state == states.handstandjump || state == states.punch))
		{
			with (other)
			{
				scr_pummel();
			}
			xscale = -other.xscale;
			obj_player1.depth = -6;
			obj_player2.depth = -7;
			thrown = true;
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_baddiegibs);
			instance_create(x, y, obj_baddiegibs);
			instance_create(x, y, obj_baddiegibs);
			with (obj_camera)
			{
				shake_mag = 3;
				shake_mag_acc = 3 / room_speed;
			}
			state = states.hurt;
			x = obj_player2.x;
			y = obj_player2.y;
			alarm[8] = 60;
			alarm[7] = 120;
			movespeed = 15;
			vsp = -6;
			xscale = -other.xscale;
			sprite_index = spr_hurt;
		}
	}
}
