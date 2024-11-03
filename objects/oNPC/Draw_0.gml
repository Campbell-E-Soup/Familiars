var shX = 0;
var shY = 0;
if (shake) {
	shX = choose(1,0,-1);
	shY = choose(1,0,-1);
}
var color = c_white;
if (freeze) {
	color = c_blue;
}
if (hp <= 0) {
	color = c_red;
}
var yOffset = 0
time+=0.06
var pos = (ds_list_find_index(NPCList,self));
yOffset = floor(sin(time+(pos*64))*2)
if (time >= pi*2) {
	time = 0;
}
draw_sprite_ext(sprite_index,image_index,x+shX,y+shY-yOffset,image_xscale,image_yscale,image_angle,color,1);
if (image_index == 1) {
	draw_text_scribble(x,y-48,$"[fa_bottom][fa_center]ATK: {atk+atkBuff}\nDEF: {finDef}\nHP:  {hp}")
}