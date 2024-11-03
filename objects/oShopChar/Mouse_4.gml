if (Gold >= 6) {
	if (ds_list_size(PCCombatList) < 4) {
		Gold-=6;
		var CharData = info;
		var PC = instance_create_layer(-100,-100,"Characters",oShopPC);
		with PC {
			/*Format
			sprite, item, hp, def, atk, familar, name
			*/
			sprite_index = CharData[0]
			item = CharData[1]
			hp = CharData[2];
			def = CharData[3];
			atk = CharData[4];
			familiar = CharData[5];
			name = CharData[6];
			
			ds_list_add(PCCombatList,self);
		}
		instance_destroy();
	}
}
playSound("Click");