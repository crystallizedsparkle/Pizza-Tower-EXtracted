pal_swap_init_system(shd_pal_swapper);
global.roommessage = "PIZZA TOWER ISLAND";
with (obj_cutoff)
{
	depth = 0;
}
if (!obj_secretmanager.init)
{
	obj_secretmanager.init = true;
	secret_add(noone, function()
	{
		if (secret_check_trigger(1))
		{
			secret_open_portal(1);
		}
		else
		{
			secret_close_portal(1);
		}
	});
	secret_add(function()
	{
		touchedtriggers = 0;
	}, function()
	{
		if (touchedtriggers >= 6)
		{
			secret_open_portal(0);
		}
	});
}