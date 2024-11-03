subText = "";

if (!variable_global_exists("WON")) {
	globalvar WON;
	WON = false;
}


	var t = layer_get_id("Thanks")
	layer_set_visible(t,WON);