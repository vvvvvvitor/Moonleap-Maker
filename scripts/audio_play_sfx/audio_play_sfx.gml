/// @function	audio_play_sfx(sound,loop,gain,pitch random)





function audio_play_sfx(argument0,argument1,argument2,argument3){
	if global.settings.enable_sfx=true
	{
		var snd=audio_play_sound(argument0,1,argument1,(power(10, argument2/20)),0,1+(random_range(-argument3,argument3)/100))
		ds_list_add(global.audio_list,audio_get_name(argument0)+"            gain:"+ string(audio_sound_get_gain(snd))+"            pitch "+ string(audio_sound_get_pitch(snd)))

	}

}

/// @function	audio_play_bgm(sound,loop,gain)

function audio_play_bgm(argument0,argument1,argument2){
	{bgm=audio_play_sound(argument0,10,argument1,(power(10, argument2/20))*(global.settings.bgm_volume))}
	ds_list_add(global.audio_list,"BGM! " +audio_get_name(argument0)+"            gain:"+ string(audio_sound_get_gain(bgm)))
}

