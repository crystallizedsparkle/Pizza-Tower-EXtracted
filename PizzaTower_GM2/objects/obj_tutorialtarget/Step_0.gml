var j = id;
with (instance_place(x, y, obj_baddiecollisionbox))
{
	if (instance_exists(baddieID) && baddieID.thrown == true)
	{
		instance_destroy(j);
	}
}
