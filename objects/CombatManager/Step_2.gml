if (clear) {
	clear = false;
	mouse_object = pointer_null;
	mouse_sprite = pointer_null;
}

//animation
if (global.CombatStarted) {
	if (combat == CombatPhase.Damage) {
		var PC = PCCombatList[| 0];
		var NPC = NPCList[| 0];
		if (instance_exists(PC) && instance_exists(NPC)) {
			PC.shake = true;
			NPC.shake = true;
			DealDamage(combat);
			combat = CombatPhase.LastStrike;
			combatTimer = 60*1.5;
		}
		else {
			combat = CombatPhase.MoveAway;
		}
	}
	else if (combat = CombatPhase.FirstStrike) {
		DealDamage(combat);
		combat = CombatPhase.Damage;
	}
	else if (combat = CombatPhase.LastStrike) {
		DealDamage(combat);
		combat = CombatPhase.AnimateDamage;
	}
	else if (combat == CombatPhase.MoveFoward) {
		var pX = 24;
		var PC = PCCombatList[| 0];
		var NPC = NPCList[| 0];
		if (ds_list_size(PCCombatList) == 0 || ds_list_size(NPCList) == 0 ) {combat = CombatPhase.Done;}
		else {
			NPC.x = Approach(NPC.x,NPC.baseX-pX,2);
			//TODO add exist checks
			PC.x = Approach(PC.x,PC.baseX+pX,2);
			if (NPC.x == NPC.baseX-pX && PC.x == PC.baseX+pX) {
				combat = CombatPhase.FirstStrike;
			}
		}
	}
	else if (combat == CombatPhase.MoveAway) {
		var pX = 0;
		var PC = PCCombatList[| 0];
		var NPC = NPCList[| 0];
		if (instance_exists(PC) && instance_exists(NPC)) {
			NPC.x = Approach(NPC.x,NPC.baseX-pX,2);
			PC.x = Approach(PC.x,PC.baseX+pX,2);
		
			if (NPC.x == NPC.baseX-pX && PC.x == PC.baseX+pX) {
				combat = CombatPhase.MoveToBack;
				ds_list_delete(PCCombatList,0);
				ds_list_add(PCCombatList,PC);
				
				if (NPC.freeze == false) {
					ds_list_delete(NPCList,0);
					ds_list_add(NPCList,NPC);
				}
				NPC.freeze = false;
			}
		}
		else if (instance_exists(NPC)) {
			NPC.x = Approach(NPC.x,NPC.baseX-pX,2);
		
			if (NPC.x == NPC.baseX-pX) {
				combat = CombatPhase.MoveToBack;
				ds_list_delete(PCCombatList,0);
				if (NPC.freeze == false) {
					ds_list_delete(NPCList,0);
					ds_list_add(NPCList,NPC);
				}
				NPC.freeze = false;
			}
		}
		else if (instance_exists(PC)) {
			PC.x = Approach(PC.x,PC.baseX+pX,2);
		
			if (PC.x == PC.baseX-pX) {
				combat = CombatPhase.MoveToBack;
				ds_list_delete(NPCList,0);
				
				ds_list_delete(PCCombatList,0);
				ds_list_add(PCCombatList,PC);
			}
		}
		else {
			combat = CombatPhase.MoveToBack;
			ds_list_delete(NPCList,0);
			ds_list_delete(PCCombatList,0);
		}
	}
	else if (combat=CombatPhase.AnimateDamage) {
		combatTimer--;
		if (combatTimer <= 0) {
			combat = CombatPhase.MoveAway;
			combatTimer = 60*1.5;
			var PC = PCCombatList[| 0];
			var NPC = NPCList[| 0];
			if (PC.hp <= 0) {
				PC.nearDeath = true;
			}
			
			if (NPC.hp <= 0) {
				instance_destroy(NPC)
			}
			
		}
		else if (combatTimer <= 60) {
			var PC = PCCombatList[| 0];
			var NPC = NPCList[| 0];
			PC.shake = false;
			NPC.shake = false;
		}
	}
	else if (combat == CombatPhase.MoveToBack) {
		var inPos = 0;
		var pX = 264;
		var NPos = 0;
		var eX = 256+128+8;
		with oPC {
			
			var i = ds_list_find_index(PCCombatList,self);
			var amt = abs((pX-(68*i)) - (pX-(68*self.pos))) div 45
			x = Approach(x,pX-(68*i),amt)
			petX = x;
			baseX = x;
			if (x == pX-(68*i)) {
				inPos++;
				self.pos = -1;
			}
		}
		
		with oNPC {
			
			var i = ds_list_find_index(NPCList,self);
			var amt = abs((eX+(68*i)) - (eX+(68*self.pos))) div 45
			x = Approach(x,eX+(68*i),amt)
			petX = x;
			baseX = x;
			if (x == eX+(68*i)) {
				NPos++;
				self.pos = -1;
			}
		}
		
		if (inPos >= ds_list_size(PCCombatList) && NPos >= ds_list_size(NPCList)) {
			combat = CombatPhase.Done;
		}
	}
}