if (!lose) { 
	if (fade > 0) {
		fade-=0.015;
		layer_background_alpha(fadeOut,fade);
	}
}
else {
	if (fade < 1) {
		fade+=0.025;
		layer_background_blend(fadeOut,c_black);
		layer_background_alpha(fadeOut,fade);
	}
	else {
		room_goto(GameOver);
	}
}

if (combat == CombatPhase.Done && global.CombatStarted == true) {
	roundTimer--;
	if (roundTimer <= 0) {
		combat = CombatPhase.MoveFoward;
		roundTimer = 30;
	}
	if (ds_list_size(PCCombatList) == 0) {
		lose = true;
	}
	else if (ds_list_size(NPCList) == 0) {
		instance_activate_object(oItemSelect);
		instance_activate_object(oLeave);
		global.CombatStarted = false;
		win = true;
		DebugMessage("Win!");
		for (var i = 0; i < ds_list_size(PCCombatList); i++) {
			var PC = PCCombatList[| i];
			var _stat = "";
			var _effect = "";
			var s = choose(0,1,2);
			if (s == 0) {
				PC.hp++;
				_stat = "HP UP!";
			}
			else if (s == 1) {
				PC.def++;
				_stat = "DEF UP!";
			}
			else if (s == 2) {
				PC.atk++;
				_stat = "ATK UP!";
			}
			var t = -1;
			var u = -1;
			if (PC.item == Items.AmuletDisc && choose(0,1) == 1) {
				t = choose(0,1,2);
				while (t == s) {
					t = choose(0,1,2);
				}
				if (t == 0) {
					PC.hp++;
					_stat += "\nHP UP!";
					}
				else if (t == 1) {
					PC.def++;
					_stat += "\nDEF UP!";
				}
				else if (t == 2) {
					PC.atk++;
					_stat += "\nATK UP!";
				}
				_effect = "[rainbow]";
			}
			
			if (PC.familiar == Familars.Lucky && choose(0,1) == 1) {
				u = choose(0,1,2);
				while (t == s) {
					u = choose(0,1,2);
				}
				if (u == 0) {
					PC.hp++;
					_stat += "\nHP UP!";
					}
				else if (u == 1) {
					PC.def++;
					_stat += "\nDEF UP!";
				}
				else if (u == 2) {
					PC.atk++;
					_stat += "\nATK UP!";
				}
				_effect = "[rainbow]";
			}
			
			var in = instance_create_layer(PC.x,PC.y-54,"UI",oStatIncrease)
			in.stat = _stat;
			in.effect += _effect;
		}
	}
}