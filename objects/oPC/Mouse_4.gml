
if (global.CombatStarted == false) {
	if (CombatManager.mouse_object = pointer_null) {
		CombatManager.mouse_sprite = sprite_index;
		CombatManager.mouse_object = self;
	}
	else {
		if (Swap(PCCombatList,self,CombatManager.mouse_object)) {
			SwapPos(self,CombatManager.mouse_object,264,256,-1)
			CombatManager.mouse_sprite = pointer_null;
			CombatManager.mouse_object = pointer_null;
			boundFrame.repos = true;
		}
		CombatManager.clear = true;
	}
	playSound("Click");
}