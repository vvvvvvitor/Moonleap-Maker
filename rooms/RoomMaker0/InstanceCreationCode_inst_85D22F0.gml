pressed = function() {
	audio_play_sfx(sndUiChange,false,-18.3,1)
	with(oLevelMaker)
	{
		style_selected+=1
		if style_selected>=5 {style_selected=0}
		scr_update_style()
	}		
}