shortcuts = [vk_down, "S"]

pressed = function() {
	with(oLevelMaker){
		yplus=+4
	    currentx+=1
		repeat(maxy) {if currentx>selectmaxx {currentx=0} if curobj=noone currenty+=1}
		audio_play_sfx(snd_morcego_02,false,-20,13)
		oButtonMakerObj.drawplus=+1
	}
}