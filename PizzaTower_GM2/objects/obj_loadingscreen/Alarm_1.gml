var len = array_length(tex_arr);
if (len > 0)
{
	var tex = array_pop(tex_arr);
	texture_prefetch(tex);
	trace("Loading texture: ", tex);
	alarm[1] = 1;
}
else
{
	instance_destroy();
}
