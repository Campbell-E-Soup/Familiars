// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playSound(soundType){
	var snd = string_lower(soundType);
	if (snd == "hover") {
		if (audio_sound_get_track_position(mouseHover) == 0  || audio_sound_get_track_position(mouseHover) > 0.25)
		{
			audio_play_sound(mouseHover,10,false);
		}
	}
	else if (snd == "click") {
		if (audio_sound_get_track_position(mouseClick) == 0  || audio_sound_get_track_position(mouseClick) > 0.5)
		{
			audio_play_sound(mouseClick,10,false);
		}
	}
	else if (snd == "upgrade") {
		if (!audio_is_playing(upgrade) && !audio_is_playing(foundFam))
		{
			audio_play_sound(upgrade,10,false,1,0,random_range(0.9,1.1));
		}
	}
	else if (snd == "damage") {
		if (!audio_is_playing(attackDamage))
		{
			audio_play_sound(attackDamage,10,false,1,0,random_range(0.9,1.1));
		}
	}
	else if (snd == "fam") {
		if (!audio_is_playing(upgrade) && !audio_is_playing(foundFam))
		{
			audio_play_sound(foundFam,10,false,1,0,random_range(0.9,1.1));
		}
	}
	else if (snd == "error") {
		if (!audio_is_playing(error))
		{
			audio_play_sound(error,10,false,1,0,random_range(0.9,1.1));
		}
	}
	else if (snd == "death") {
		if (!audio_is_playing(death))
		{
			audio_play_sound(death,10,false,1,0,random_range(0.9,1.1));
		}
	}
	else if (snd == "good") {
		if (!audio_is_playing(upgrade) && !audio_is_playing(foundFam))
		{
			audio_play_sound(foundFam,10,false,1,0,random_range(0.9,1.1));
		}
	}
	DebugMessage(soundType)
}