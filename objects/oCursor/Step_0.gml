if (!audio_is_playing(musicBattle) && !audio_is_playing(musicDungeon)) {
	if (room == Room1) {
		audio_play_sound(musicBattle,10,false);
	}
	else {
		audio_play_sound(musicDungeon,10,false);
	}
}