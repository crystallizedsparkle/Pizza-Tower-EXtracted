if (instance_exists(obj_player))
{
	if (custom_level == false)
	{
		with (obj_player)
		{
			if (place_meeting(x, y, obj_goldendoor))
			{
				game_restart();
			}
		}
		if (room != obj_player1.targetRoom || roomreset)
		{
			var r = room;
			scr_room_goto(obj_player1.targetRoom);
			if (r == tower_peppinohouse)
			{
				scr_unlock_swap();
			}
			with (obj_player)
			{
				if (state == states.ejected || state == states.taxi2)
				{
					visible = true;
					state = states.normal;
				}
			}
		}
		if (global.coop == true)
		{
			if (room != obj_player2.targetRoom || roomreset)
			{
				scr_room_goto(obj_player1.targetRoom);
			}
			with (obj_player)
			{
				if (state == states.ejected)
				{
					state = states.normal;
				}
			}
			with (obj_player2)
			{
				if (instance_exists(obj_coopplayerfollow))
				{
					state = states.gotoplayer;
				}
			}
		}
	}
}
