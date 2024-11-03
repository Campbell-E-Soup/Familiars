if (global.CombatStarted == true) {
	if (combat == CombatPhase.Done) {
		baseX = x;
		baseY = y;
		if (pos == -1) {
			pos = ds_list_find_index(NPCList,self);
		}
	}
}