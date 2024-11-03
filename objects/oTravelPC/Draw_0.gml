time+=0.07;
var yOffset = floor(sin(time+(pos*64))*2)
if (time >= 2*pi) {
	time = 0;
}

draw_sprite_ext(sprite_index,image_index,x,y-yOffset,image_xscale,image_yscale,0,c_white,1);
draw_sprite_ext(sFamiliars,(familiar*2)+image_index,x-16, y-yOffset+2,image_xscale,image_yscale,0,c_white,1)