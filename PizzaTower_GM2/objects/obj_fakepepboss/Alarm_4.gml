with (create_red_afterimage(x, y, sprite_index, image_index - 1, image_xscale))
{
	playerid = other.id;
	if (other.state == states.grabdash)
	{
		identifier = afterimagetype.red_alt;
	}
}
if (state == states.rage)
{
	alarm[4] = 5;
}
