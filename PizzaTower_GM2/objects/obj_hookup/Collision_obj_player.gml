with (other)
{
	if (other.appear == -1 && key_up && ladderbuffer == 0 && (state == states.fireass || state == states.machcancel || state == states.punch || state == states.normal || state == states.pogo || state == states.mach2 || (state == states.mach3 && sprite_index != spr_fightball) || state == states.mach1 || state == states.shotgunjump || state == states.jump || state == states.highjump) && state != states.hurt && state != states.machslide && state != states.freefall && state != states.freefallland)
	{
		fmod_event_instance_play(other.snd);
		other.hooked = true;
		hooked = true;
		mach2 = 0;
		state = states.ladder;
		x = other.x + 16;
		y = other.y + 40;
	}
}
