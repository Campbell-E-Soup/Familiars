image_alpha = 0;
tiltDir = choose(1,-1);

image_angle = choose(1,-1)
if (room = Credits) {
	system = MainMenu
	image_alpha = 1;
}
else {
	system = oGameOver;
}