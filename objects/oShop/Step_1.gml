if (clear) {
	clear = false;
	mouse_object = pointer_null;
	mouse_sprite = pointer_null
}


if (fade > 0) {
	fade-=0.015;
	layer_background_alpha(fadeOut,fade);
}