if (image_alpha < 1) {
	image_alpha += 0.01;
}

image_angle+=0.25*tiltDir;

if (abs(image_angle) >= 10) {
	tiltDir = -tiltDir;
}