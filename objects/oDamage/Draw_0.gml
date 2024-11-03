draw_text_scribble(x,y-24,$"[wobble][fntHeader][fa_center][c_white]{dmg}");
y -= 0.5

image_alpha-=0.025;

if (image_alpha <= 0) {
	instance_destroy();
}