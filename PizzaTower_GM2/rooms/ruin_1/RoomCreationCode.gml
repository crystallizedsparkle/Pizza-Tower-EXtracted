pal_swap_init_system(shd_pal_swapper);
global.roommessage = "RUINS OF THE PIZZA TOWER";
global.gameframe_caption_text = lang_get_value("caption_ruin");
if (!obj_secretmanager.init)
{
	obj_secretmanager.init = true;
	secret_add(noone, function()
	{
		secret_open_portal(0);
	});
	secret_add(noone, function()
	{
		if (secret_check_trigger(1))
		{
			secret_open_portal(1);
		}
	});
	secret_add(noone, function()
	{
		secret_open_portal(2);
	});
}