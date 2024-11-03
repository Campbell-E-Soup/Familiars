if (mouse_sprite != pointer_null) {
	draw_sprite_ext(mouse_sprite,0,mouse_x,mouse_y,1,1,0,c_white,0.45);
}
draw_text_scribble(32, 100,"[fntHeader]Price: 3 [sCoin]");
draw_text_scribble(32, 304,"[fntHeader]Price: 6 [sCoin]");
if (in == false) {
	in = true;
	instance_activate_object(oItemSelect)
}

draw_text_scribble(25,5,$"[fntHeader][fa_center][sCoin] {Gold}")