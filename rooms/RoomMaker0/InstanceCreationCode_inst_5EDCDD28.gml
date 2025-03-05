pressed = function() {
	audio_play_sfx(sndUiChange,false,-18.3,1)
	//d_loadLevel = get_string_async("Level name","Level_0");
	d_loadLevel = get_open_filename("*.moonlevel","mylevel");
	if(d_loadLevel != "") { load_level(d_loadLevel)}
}