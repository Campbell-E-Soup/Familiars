if (win == true) {
	Team = [
		[],
		[],
		[],
		[]
	]
	for (var i = 0; i < ds_list_size(PCCombatList); i++) {
		//sprite, item, hp, def, atk, familar
		var PC = PCCombatList[| i]
		with PC {
			var data = [sprite_index,item,hp,def,atk,familiar];
			Team[i] = data;
		}
	}
	//TODO add camp / store
	room_restart();
}