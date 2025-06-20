targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
if (hp <= 0 && state != states.arenaround)
{
	if (!destroyed && !thrown && !destroyable)
	{
		boss_destroy(lastplayerid);
	}
}
switch (state)
{
	case states.arenaround:
		grav = 0.5;
		state_boss_arenaround();
		break;
	case states.normal:
		grav = 0.5;
		boss_mrstick_normal();
		break;
	case states.mrstick_shield:
		grav = 0.5;
		boss_mrstick_shield();
		break;
	case states.mrstick_helicopterhat:
		grav = 0.5;
		boss_mrstick_helicopterhat();
		break;
	case states.mrstick_panicjump:
		grav = 0.5;
		boss_mrstick_panicjump();
		break;
	case states.jump:
		grav = 0.5;
		boss_mrstick_jump();
		break;
	case states.mrstick_smokebombstart:
		grav = 0.5;
		boss_mrstick_smokebombstart();
		break;
	case states.mrstick_smokebombcrawl:
		grav = 0.5;
		boss_mrstick_smokebombcrawl();
		break;
	case states.mrstick_springshoes:
		grav = 0.5;
		boss_mrstick_springshoes();
		break;
	case states.mrstick_cardboard:
		grav = 0.5;
		boss_mrstick_cardboard();
		break;
	case states.mrstick_cardboardend:
		grav = 0.5;
		boss_mrstick_cardboardend();
		break;
	case states.mrstick_mockery:
		grav = 0.5;
		boss_mrstick_mockery();
		break;
	case states.walk:
		grav = 0.5;
		state_boss_walk(boss_mrstick_decide_attack);
		inv_timer = 2;
		invincible = true;
		break;
	case states.chainsaw:
		grav = 0.5;
		state_boss_chainsaw();
		break;
	case states.backbreaker:
		grav = 0.5;
		state_boss_taunt();
		invincible = true;
		inv_timer = 2;
		break;
	case states.parry:
		grav = 0.5;
		state_boss_parry();
		invincible = true;
		inv_timer = 2;
		break;
	case states.hit:
		grav = 0.5;
		scr_enemy_hit();
		stunned = targetstunned;
		break;
	case states.stun:
		grav = 0.5;
		state_boss_stun();
		break;
}
colliding = !(state == states.jump || state == states.mrstick_cardboard || state == states.mrstick_cardboardend);
attacking = state == states.mrstick_shield || state == states.jump || state == states.mrstick_cardboard || state == states.mrstick_cardboardend || state == states.mrstick_smokebombstart;
