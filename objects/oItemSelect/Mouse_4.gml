var otherFrame = pointer_null 
playSound("Click");
with oItem {
	if (selected) {
		otherFrame = self;
		break;
	}
}
if (room == Shop) {
	if (Gold < 3) {exit;}
}
if (otherFrame == pointer_null) {
	oItemSelect.selected = false;
	oItemSelect.image_index = 0;
	selected = true;
	image_index = 1;
}
else {
	var temp = item;
	item = otherFrame.ItemSprite;
	otherFrame.ItemSprite = temp;
	
	otherFrame.boundPC.item = otherFrame.ItemSprite;
	
	selected = false
	image_index = 0;
	otherFrame.selected = false;
	otherFrame.image_index = 0;
	if (room == Shop) {
		Gold-=3;
	}
}