movespeed = 3;
scene_info =
[
	[cutscene_superpinball_start],
	[cutscene_superpinball_middle],
	[cutscene_superpinball_middle2],
	[cutscene_change_room, hub_superpinball3],
	[cutscene_set_player_pos, 1060, 270],
	[cutscene_superpinball_middle3],
	[cutscene_superpinball_middle4],
	[cutscene_change_room, hub_pubentrance],
	[cutscene_superpinball_middle5],
	[cutscene_set_player_pos, 576, -10],
	[cutscene_player_check_ground, obj_player1],
	[cutscene_soundeffect, sfx_groundpound],
	[cutscene_camera_shake, 4, 3 / room_speed],
	[cutscene_wait, 100],
	[cutscene_change_room, hub_pub],
	[cutscene_set_player_pos, 700, 562],
	[cutscene_superpinball_end]
];
