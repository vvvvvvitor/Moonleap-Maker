pressed = function() {
	{
		audio_play_sfx(sndUiChange,false,-18.3,1)
		//d_levelName = get_string_async("Level name","Level_0");
		d_levelName = get_save_filename("*.moonlevel","mylevel");
		if(d_levelName != "") {save_level(d_levelName)}
	
	}
}