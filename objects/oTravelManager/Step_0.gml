if (fade > 0) {
	fade-=0.015;
	layer_background_alpha(fadeOut,fade);
}
else {
	walk = true;
}
if (doorOffset >= 420) {walk = false; layer_x("Doors",420); wait++;}
if (walk) {
	doorOffset+=1.5;
	layer_x("Doors",doorOffset);
	if (doorOffset == 60) {
		var event = events[| irandom(ds_list_size(events)-1)];
		if (event == sGoblinMage) {
			with oTravelPC {
				atk -= 1;
				
			}
			eventText = "[c_red]You were unable to avoid a trap: -1 ATK";
			playSound("Error");
		}
		else if (event == sGoblinBarb) {
			with oTravelPC {
				def -= 1;
			}
			eventText = "[c_red]You were unable to avoid a trap: -1 DEF";
			playSound("Error");
		}
		else if (event == sPaladin) {
			with oTravelPC {
				def += 2;
			}
			eventText = "The Paladin finds some armor polish: +1 DEF";
			playSound("good");
		}
		else if (event == sWizard) {
			with oTravelPC {
				atk += 2;
			}
			eventText = "The Wizard finds an ancient tome: +2 ATK";
			playSound("good");
		}
		else if (event == sRogue) {
			with oTravelPC {
				Gold++;
			}
			eventText = "The Rogue finds some gold: +1 [sCoin] for each party member";
			playSound("good");
		}
		else if (event == sCook) {
			with oTravelPC {
				hp+=1;
			}
			eventText = "The Cook prepares a hearty meal: +1 HP";
			playSound("good");
		}
		else if (event == sSmith) {
			with oTravelPC {
				def+=1;
			}
			eventText = "The Smith repairs your armor: +1 DEF";
			playSound("good");
		}
		else {
			eventText = "Nothing happens..."
		}
	}
	if (doorOffset > 100) {
		typeWriter++;
	}
}

if (wait >= 120) {
	Bonus = false;
	wait = -1000000;
	instance_create_layer(0,0,"System",oFade)
}