var str = Concat(effect,stat)

draw_text_scribble(x,y,str);

image_alpha -= 1;
if (image_alpha<= 0) {
	instance_destroy()
}

y-=0.1