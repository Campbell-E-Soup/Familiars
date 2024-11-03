var shX = 0;
var shY = 0;
var yOffset = 0
time+=0.06
yOffset = floor(sin(time+(pos*64))*2)
if (time >= pi*2) {
	time = 0;
}
var color = c_white
draw_sprite_ext(sprite_index,image_index,x+shX,y+shY-yOffset,image_xscale,image_yscale,image_angle,color,1);
draw_sprite_ext(sFamiliars,(familiar*2)+image_index,baseX-16, baseY+2,image_xscale,image_yscale,0,c_white,1)
if (image_index == 1) {
	draw_text_scribble(x,y-56,$"[fa_bottom][fa_center]{name}\nATK: {atk+atkBuff}\nDEF: {finDef}\nHP:  {hp}")
}

if (sprite_index == sWitch) {
	familiar = Familars.Lucky;
}

baseX = x;
baseY = y;
if (pos == -1) {
	pos = ds_list_find_index(PCCombatList,self);
	var xx = 352;
	var yy = 224;
	x = xx+(68*pos);
	y = yy;
	
}

if (familiar == -1) {
	familiar = irandom_range(Familars.Cat,Familars.Monkey)
}

if (hp < 6) {hp = 6;}