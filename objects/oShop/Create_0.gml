var xx = 352;
var yy = 224;
draw_set_font(fntDefault);

global.CombatStarted = false;

globalvar PCCombatList;

PCCombatList = ds_list_create();

clear = false
var array = Team;
DebugMessage(string(Team))

for (var i = 0; i < 4; i++) {
	var CharData = Team[i];
	show_debug_message(string(CharData))
	if (array_length(CharData) > 0) {
		show_debug_message("HELLO")
		var PC = instance_create_layer(xx+(68*i),yy,"Characters",oShopPC);
		/*Format
		sprite, item, hp, def, atk, familar, name
		*/
		with PC {
			sprite_index = CharData[0];
			item = CharData[1];
			hp = CharData[2];
			def = CharData[3];
			atk = CharData[4];
			familiar = CharData[5];
			name = CharData[6];
			ds_list_add(PCCombatList,self);
		}
	}
}

for (var i = 0; i < 3; i++) {
	var Data;
	var Type = Characters.Witch;
	if (i == 0) {
		if (Level == 4) {
			Type = Characters.Barb;
		}
		else if (Level == 7) {
			Type = choose(Characters.Witch,Characters.Barb);
		}
	}
	else if (i == 1) {
		Type = choose(Characters.Wizard,Characters.Rogue,Characters.Paladin,Characters.Cook,Characters.Farmer,Characters.Smith);
	}
	else if (i == 2) {
		Type = choose(Characters.Cook,Characters.Farmer,Characters.Smith);
	}
	Data = CharacterInfo[Type]
	/*Format
	sprite, item, hp, def, atk, familar, name
	*/
	for (var j = 0; j < Level; j++) {
		Data[choose(2,3,4)]++;
	}
	var SHOP = instance_create_layer(64+(i*96),256,"Characters",oShopChar);
	with SHOP {
		type = Type;
		info = Data;
		sprite_index = info[0];
	}
	
	
}
mouse_sprite = pointer_null;
mouse_object = pointer_null;

in = false;
fade = 1.2;
fadeOut = layer_background_get_id("Fade");