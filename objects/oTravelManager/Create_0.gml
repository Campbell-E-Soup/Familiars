Level++;
walk = true;
fade = 1.2;
events = ds_list_create();
ds_list_add(events,sGoblinBarb) //-atk
ds_list_add(events,sGoblinMage) //-def
ds_list_add(events,sCat); //def
ds_list_add(events,sDog); //atk
fadeOut = layer_background_get_id("Fade");

door = layer_background_get_id("Doors");

doorOffset = 0;

for (var i = 0; i < array_length(Team); i++) {
	var CharData = Team[i];
	if (array_length(CharData) > 0) {
		/*Format
		sprite, item, hp, def, atk, familar, event*/
		ds_list_add(events,CharData[0]);
		var PC = instance_create_layer(350+(68*i),275,"PCs",oTravelPC);
		with PC {
			sprite_index = CharData[0];
			item = CharData[1];
			hp = CharData[2];
			def = CharData[3];
			atk = CharData[4];
			familiar = CharData[5];
			name = CharData[6];
			pos = i;
		}
	}
}

eventText = "";
typeWriter = 0;

wait = 0;
