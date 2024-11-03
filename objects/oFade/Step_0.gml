if (fade >= 1) {
	var t = [
	[],
	[],
	[],
	[]
	]
	for (var i = 0; i < 4; i++) {
		/*Format
		sprite, item, hp, def, atk, familar, event*/
		with oTravelPC {
			if (pos == i) {
				var CharData = [sprite_index,item,hp,def,atk,familiar,name];
				t[pos] = CharData;
				break;
			}
		}
	}
	Team = t;
	if (Level !=4 && Level != 7) {
		room_goto(Room1);
	}
	else {
		room_goto(Shop)
	}
}
fade+=0.015;
layer_background_alpha(fadeOut,fade);