draw_self();
if (ItemSprite != -1) {
	draw_sprite(sItems,(ItemSprite*2)+image_index,x,y);
}

if (image_index == 1) {
	var color = c_white
	if (tipScale < 1) {tipScale+=0.1; color = c_black} else {tipScale = 1}
	if (ItemSprite > Items.None) {
		draw_sprite_ext(sTipNPC,0,494,82,tipScale,tipScale,0,color,tipScale);
		if (tipScale >= 1) {
			var Item, Name;
			Item = DescItem[ItemSprite];
			Name = ItemName[ItemSprite];
			var length = 120;
			
			draw_text_scribble_ext(494,82-56,Concat("[fa_center][fa_top][c_outline]",Name,":\n\n",Item),length);
		}
	}
}
else {
	tipScale = 0;
}