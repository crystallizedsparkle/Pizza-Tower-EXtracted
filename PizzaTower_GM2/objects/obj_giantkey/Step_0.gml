if (grounded && bounce == false)
{
	vsp = -6;
	alarm[1] = 40;
	bounce = true;
}
scr_collide();
