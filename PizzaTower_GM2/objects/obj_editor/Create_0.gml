editor_states = ds_map_create();
editor_state = editorstates.init;
ds_map_set(editor_states, editorstates.instance_edit, function()
{
	toggle_menu_layer(0);
});
ds_map_set(editor_states, editorstates.unknown2, function()
{
	toggle_menu_layer(1);
});
alarm[0] = 1;
depth = 1;
rooms = ds_list_create();
current_room = noone;
editor_input_init();
commands_init();
editor_camera_init();
instance_edit_init();
save_level_init();
backgrounds_list = ds_list_create();
for (var i = 0; i < array_length(global.editor_data.backgrounds); i++)
{
	ds_list_add(backgrounds_list, asset_get_index(global.editor_data.backgrounds[i]));
}
for (var i = 0; i < docks.last; i++)
{
	with (instance_create_depth(0, 0, depth - 1, obj_roomresize))
	{
		dock = i;
	}
}
