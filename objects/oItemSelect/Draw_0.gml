var color = c_white;
if (image_alpha < 1) {image_alpha+=0.1;}
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,color,image_alpha);
draw_sprite_ext(sItems,(item*2)+image_index,x,y,image_xscale,image_yscale,0,color,image_alpha);

if (image_index = 1) {
	if (ID == 1) {
		color = c_white
		if (tipScale < 1) {tipScale+=0.1; color = c_black} else {tipScale = 1}
		draw_sprite_ext(sTipNPC,0,146,82,tipScale,tipScale,0,color,tipScale)
		if (item > Items.None) {
			if (tipScale >= 1) {
			var Item, Name;
				Item = DescItem[item];
				Name = ItemName[item];
				var length = 112;
			
				draw_text_scribble_ext(146,82-56,Concat("[fa_center][fa_top][c_outline]",Name,":\n\n",Item),length);
			}
		}
	}
	else {
		var xx = 494;
		var yy = 82;
		if (room == Shop) {
			xx = 464;
			yy = 82;
		}
		color = c_white
		if (tipScale < 1) {tipScale+=0.1; color = c_black} else {tipScale = 1}
		draw_sprite_ext(sTipNPC,0,xx,yy,tipScale,tipScale,0,color,tipScale);
		if (item > Items.None) {
			if (tipScale >= 1) {
			var Item, Name;
				Item = DescItem[item];
				Name = ItemName[item];
				var length = 112;
			
				draw_text_scribble_ext(xx,yy-56,Concat("[fa_center][fa_top][c_outline]",Name,":\n\n",Item),length);
			}
		}
	}
}
else {
	tipScale = 0;
}