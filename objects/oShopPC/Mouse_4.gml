if (oShop.mouse_object = pointer_null) {
		oShop.mouse_sprite = sprite_index;
		oShop.mouse_object = self;
}
else {
	var xx = 352;
	var yy = 224;
	if (Swap(PCCombatList,self,oShop.mouse_object)) {
		SwapPos(self,oShop.mouse_object,xx,yy,1)
		oShop.mouse_sprite = pointer_null;
		oShop.mouse_object = pointer_null;
		boundFrame.repos = true;
	}
	oShop.clear = true;
}
playSound("Click");