function scr_sound_multiple(_snd, _x, _y)
{
	if (ds_map_find_value(global.sound_map, _snd) == undefined)
	{
		ds_map_set(global.sound_map, _snd, ds_list_create());
	}
	var _list = ds_map_find_value(global.sound_map, _snd);
	for (var i = 0; i < ds_list_size(_list); i++)
	{
		b = ds_list_find_value(_list, i);
		fmod_event_instance_stop(b, false);
		fmod_event_instance_release(b);
	}
	ds_list_clear(_list);
	var b = fmod_event_create_instance(_snd);
	fmod_event_instance_play(b);
	fmod_event_instance_set_3d_attributes(b, _x, _y);
	ds_list_add(_list, b);
}
