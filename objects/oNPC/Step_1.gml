if (!global.CombatStarted && CombatManager.win == false) {
	atkBuff = 0; defBuff = 0;
	switch item {
		case Items.Buckler: atkBuff += 0; defBuff += 2; break;
		case Items.Dagger: atkBuff += 1; defBuff += 0; break;
		case Items.Flail: atkBuff += 2; defBuff += 0; break;
		case Items.Spellbook: atkBuff += 4; defBuff += -2; break;
		case Items.IronHelm: atkBuff += -2; defBuff += 6; break;
		case Items.Shield: atkBuff += 0; defBuff += 4; break;
		case Items.AmuletDisc: atkBuff += 1; defBuff += 1; break;
		case Items.RingArmor: atkBuff += 0; 
		if (ds_list_size(PCCombatList) > 0) defBuff += PCCombatList[| 0].atk/3;
			break;
		default: atkBuff = 0; defBuff = 0;
	}
	finDef = def+defBuff;
}