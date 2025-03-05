pressed = function() {
	audio_play_sfx(sndUiChange,false,-18.3,1)
	with(oLevelMaker)
	{
		style_selected = (style_selected + 1) % 5
		scr_update_style()
	}		
}