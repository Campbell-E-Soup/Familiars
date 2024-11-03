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
			if (ds_list_size(NPCList) > 0) defBuff += NPCList[| 0].atk;
				break;
		default: atkBuff = 0; defBuff = 0;
	}
	if (familiar == Familars.Turtle) {
		finDef = (def*2) + defBuff;
	}
	else if (familiar == Familars.Cat) {
		defBuff+=2;
	}
	else if (familiar == Familars.Dog) {
		atkBuff+=1;
	}
	else if (familiar == Familars.Lucky) {
		atkBuff+=4;
		defBuff+=4;
	}
	finDef = def+defBuff;
}

if (nearDeath) {
	if (familiar == Familars.None) {
		nearDeath = false
		hp = 9;
		finDef = (def+defBuff) div 2;
		familiar = irandom_range(Familars.Cat,Familars.Monkey);
		var text = instance_create_layer(x,y-64,"UI",oFoundFamilar);
		text.boundPC = self;
	}
	else {
		instance_destroy();
	}
}