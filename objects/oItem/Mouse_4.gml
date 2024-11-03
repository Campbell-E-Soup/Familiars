if (global.CombatStarted == false) {
	playSound("Click");
	var otherFrame = pointer_null;
	with oItem {
		if (selected = true) {
			otherFrame = self;
			break;
		}
	}
	if (otherFrame == pointer_null) {
		with oItemSelect {
			if (selected = true) {
				otherFrame = self;
				break;
			}
		}
	}
	if (otherFrame == pointer_null) {
		selected = true;
		image_index = 1;
	}
	else {
		if (otherFrame.object_index == oItem) {
			if (otherFrame != self) {
				var temp = ItemSprite;
				ItemSprite = otherFrame.ItemSprite;
				with otherFrame {
					ItemSprite = temp;
					selected = false;
					image_index = 0;
					boundPC.item = ItemSprite;
				}
				boundPC.item = ItemSprite;
			}
		}
		else if (otherFrame.object_index == oItemSelect) {
			var temp = ItemSprite;
			ItemSprite = otherFrame.item;
			with otherFrame {
				item = temp;
				selected = false;
				image_index = 0;
			}
			boundPC.item = ItemSprite;
			if (room == Shop) {
				Gold-=3;
			}
		
		}
		selected = false;
	}
}
else {
	selected = false;
}