draw_self();
if (ItemSprite != -1) {
	draw_sprite(sItems,(ItemSprite*2)+image_index,x,y);
}
if (image_index == 1) {
	if (ItemSprite > Items.None || boundPC.familiar > Familars.None) {
		var color = c_white
		var img = 0;
		var xx = 146;
		var yy = 82;
		if (room == Shop) {
			xx = 464;
			yy = 82;
		}
		if (ItemSprite > Items.None && boundPC.familiar > Familars.None) {img = 0;}
		else if (ItemSprite > Items.None) {img = 1;}
		else if (boundPC.familiar > Familars.None) {img = 1;}
		if (tipScale < 1) {tipScale+=0.1; color = c_black;} else {tipScale = 1}
		draw_sprite_ext(sTip,img,xx,yy,tipScale,tipScale,0,color,tipScale)
		if (tipScale >= 1) {
			var Item, Name;
			Item = DescItem[ItemSprite];
			Name = ItemName[ItemSprite];
			
			var ItemFam, NameFam;
			var Fam = DescFamiliar[boundPC.familiar];
			var FamName = FamiliarName[boundPC.familiar];
			if (img = 0) {
				var length = 100;
				draw_text_scribble_ext(xx-64,yy-56,Concat("[fa_center][fa_top][c_outline]",Name,":\n\n",Item),length);
				draw_text_scribble_ext(xx+64,yy-56,Concat("[fa_center][fa_top][c_outline]",FamName,":\n\n",Fam),length);
			}
			else if (ItemSprite > Items.None) {
				var length = 120;
				draw_text_scribble_ext(xx,yy-56,Concat("[fa_center][fa_top][c_outline]",Name,":\n\n",Item),length);
			}
			else {
				var length = 120;
				draw_text_scribble_ext(xx,yy-56,Concat("[fa_center][fa_top][c_outline]",FamName,":\n\n",Fam),length);
			}
		}
	}
}
else {
	tipScale = 0;
}