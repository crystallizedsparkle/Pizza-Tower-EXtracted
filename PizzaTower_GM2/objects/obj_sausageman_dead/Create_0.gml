vsp = random_range(-10, -18);
hsp = sign(x - obj_player.x) * random_range(10, 18);
grav = 0.4;
angle = 0;
spinspeed = choose(0, 0, 0, 10, 20);
alarm[0] = 5;
cigar = false;
stomped = false;
oldpalettetexture = noone;
buffer = 10;
if (x != obj_player1.x)
{
	image_xscale = -sign(x - obj_player1.x);
}
depth = -999;
gui = false;
usepalette = false;
paletteselect = 0;
spr_palette = bg_chateauscrolldeco;
d = 255; // c_red
