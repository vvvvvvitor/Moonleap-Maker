shortcuts = [vk_up, "W"]

pressed = function() {
	with(oLevelMaker)
	{
		yplus=-4
		currentx-=1
		repeat(maxx) {if currentx<0 {currentx=selectmaxx} if curobj=noone currentx-=1}
		audio_play_sfx(snd_morcego_02,false,-20,13)
		oButtonMakerObj.drawplus=-1
	}
}