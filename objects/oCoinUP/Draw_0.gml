draw_text_scribble(room_width div 2,(room_height div 2)-64,$"[fntHeader][fa_center][wave][sCoin] +{amt}")

timer--;
if (timer <= 0) {
	instance_destroy();
}