if (prompt_array != noone && prompt_condition != noone && prompt_condition())
{
	if (ds_list_find_index(global.saveroom, id) == -1)
	{
		tv_push_prompt_array(prompt_array);
		ds_list_add(global.saveroom, id);
		instance_destroy();
	}
}
