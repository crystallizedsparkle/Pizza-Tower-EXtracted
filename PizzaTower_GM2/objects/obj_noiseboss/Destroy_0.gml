if (elitehit <= 0 && destroyable)
{
	scr_noise_destroy_sounds();
}
if (pizzahead && elitehit <= 0 && destroyable)
{
	with (instance_create(room_width / 4, room_height + 100, obj_fakepepboss))
	{
		instance_destroy(spotlightID);
		phase = 2;
		pizzahead = true;
		flickertime = 0;
		state = states.pizzaheadjump;
		sprite_index = spr_fakepeppino_jump;
		image_index = 0;
		image_speed = 0.35;
		hsp = 0;
		vsp = -18;
		elitehit = 4;
		prevhp = elitehit;
		
		fakepep_set_attack(1, 0, fakepep_attacks.grab, 80, 0);
		fakepep_set_attack(1, 1, fakepep_attacks.bodyslam, 80, 0);
		fakepep_set_attack(1, 2, fakepep_attacks.throwhead, 120, 0);
		fakepep_set_attack(1, 3, fakepep_attacks.taunt, 120, 0);
		fakepep_set_attack(1, 4, fakepep_attacks.taunt, 120, 0);
		
		fakepep_start_projectiles(1, 0);
		fakepep_add_grabclone(1, 0, 1, 180);
		fakepep_add_grabclone(1, 0, -1, 180);
		fakepep_start_projectiles(1, 1);
		fakepep_add_bodyslamclone(1, 1, 1, 180);
		fakepep_add_bodyslamclone(1, 1, -1, 180);
		fakepep_start_projectiles(1, 2);
		fakepep_add_flailingclone(1, 2, 1, 100);
		fakepep_add_flailingclone(1, 2, -1, 100);
		fakepep_start_projectiles(1, 3);
		fakepep_add_tauntclones(1, 3, -12, -15, 120);
		fakepep_add_tauntclones(1, 3, -15, -12, 120);
		fakepep_add_tauntclones(1, 3, -11, -11, 120);
		fakepep_add_tauntclones(1, 3, -13, -8, 120);
		fakepep_add_tauntclones(1, 3, -8, -13, 120);
	}
	with (obj_bosscontroller)
	{
		boss_hpsprite = spr_bossfight_fakepephp;
		boss_palette = spr_bossfight_fakepeppalette;
	}
	if (doise)
	{
		with (instance_create(x, y, obj_sausageman_dead))
		{
			sprite_index = other.spr_dead;
			spr_palette = other.spr_palette;
			paletteselect = other.paletteselect;
			usepalette = other.usepalette;
			if (!usepalette)
			{
				paletteselect = 0;
			}
			image_alpha = other.image_alpha;
			sprite_index = spr_doise_deadair;
			hsp = 0;
			vsp = 0;
		}
	}
}
if (elitehit <= 0 && destroyable)
{
	instance_destroy(obj_noisey);
}
if (!pizzahead || !doise)
{
	event_inherited();
}
