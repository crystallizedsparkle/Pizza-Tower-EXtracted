function scr_switchgustavo(_setstate = true, _noisegloves = false)
{
	with (obj_player1)
	{
		if (ispeppino)
		{
			ratmount_movespeed = 8;
			gustavodash = 0;
			isgustavo = true;
			if (_setstate)
			{
				visible = true;
				state = states.ratmount;
				sprite_index = spr_player_ratmountidle;
				jumpAnim = false;
			}
			brick = true;
			fmod_event_instance_release(snd_voiceok);
			snd_voiceok = fmod_event_create_instance("event:/sfx/voice/gusok");
		}
		else
		{
			isgustavo = false;
			noisecrusher = true;
			if (_setstate)
			{
				visible = true;
				jumpAnim = false;
				state = states.normal;
				sprite_index = spr_idle;
				if (room == street_jail && !_noisegloves)
				{
					actor_buffer = 40;
					sprite_index = spr_playerN_glovesstart;
					image_index = 0;
					state = states.animation;
				}
			}
		}
	}
	with (obj_swapmodefollow)
	{
		isgustavo = true;
		get_character_spr();
	}
}

function scr_switchpeppino(_setstate = true)
{
	with (obj_player1)
	{
		if (ispeppino)
		{
			gustavodash = 0;
			ratmount_movespeed = 8;
			isgustavo = false;
			brick = false;
			fmod_event_instance_release(snd_voiceok);
			snd_voiceok = fmod_event_create_instance("event:/sfx/voice/ok");
			if (_setstate)
			{
				visible = true;
				state = states.normal;
				jumpAnim = false;
				sprite_index = spr_player_idle;
			}
		}
		else
		{
			isgustavo = false;
			noisecrusher = false;
			if (_setstate)
			{
				jumpAnim = false;
				sprite_index = spr_idle;
				visible = true;
				state = states.normal;
			}
		}
	}
	with (obj_swapmodefollow)
	{
		isgustavo = false;
		get_character_spr();
	}
}
