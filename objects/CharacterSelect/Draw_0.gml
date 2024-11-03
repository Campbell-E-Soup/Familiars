if (selection == 0) {
	draw_text_scribble(room_width div 2, 32,"[wave][c_outline][fa_center][fntHeader]who are you..?")
}
else if (selection == 1) {
	draw_text_scribble(room_width div 2, 32,"[wave][c_outline][fa_center][fntHeader]pick a familiar")
}
else if (selection == 2) {
	var one = choose(Characters.Farmer,Characters.Smith,Characters.Cook);
	var two = choose(Characters.Farmer,Characters.Smith,Characters.Cook);
	while (two == one) {
		two = choose(Characters.Farmer,Characters.Smith,Characters.Cook);
	}
	Team[1] = CharacterInfo[one];
	Team[2] = CharacterInfo[two];
	room_goto(Room1)
}
draw_text_scribble(room_width div 2, room_height-48,$"[c_outline][fa_center][fntHeader]{subText}")