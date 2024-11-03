if (pressed) {
	if (fade <= 1.5) {
		fade+=0.02;
		layer_background_alpha(fadeOut,fade);
	}
	else {
		Team = [
			[],
			[],
			[],
			[]
		]
		var monk = 0;
		var going = false
		for (var i = 0; i < ds_list_size(PCCombatList); i++) {
			//sprite, item, hp, def, atk, familar
			var PC = PCCombatList[| i]
			with PC {
				var data = [sprite_index,item,hp,def,atk,familiar,name];
				Team[i] = data;
				if (familiar == Familars.Monkey) {
					monk++;
					DebugMessage("Monke")
				}
			}
		}
		if (room == Room1) {
			if (Bonus == false) {
				for (var j = 0; j < monk; j++) {
					if (irandom(2) <= 2) {
						Bonus = true;
						DebugMessage("Bonus!")
						room_goto(Room1);
						going = true
						break;
					}
				}
			}
		}
		if (!going) {
			if (room == Room1) {
				room_goto(Travel);
			}
			else {
				room_goto(Room1);
			}
		}
	}
}