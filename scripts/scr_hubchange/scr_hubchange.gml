// Script assets have changed for v2.3000.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_hubchange(){

	hgain =(power(10, -8.7/20))
	hgain1=(power(10, -7.3000/20))
	hgain2=(power(10, -9.2/20))
	hgain3=(power(10, -11.4/20))
	hgain4=(power(10, -9.9/20))

	if hub=true and global.settings.bgm_volume=true{
		audio_sound_gain(bgm_hub,hgain,3000)
		
	}
	else{
		audio_sound_gain(bgm_hub,0.001,3000)
	}

	if hub1=true and global.settings.bgm_volume=true{
		audio_sound_gain(bgm_hub_01,hgain1,3000)
	}
	else{
		audio_sound_gain(bgm_hub_01,0.001,3000)
	}
	if hub2=true and global.settings.bgm_volume=true{
		audio_sound_gain(bgm_hub_02,hgain2,3000)
	}
	else{
		audio_sound_gain(bgm_hub_02,0.001,3000)
	}

	if hub3=true and global.settings.bgm_volume=true{
		audio_sound_gain(bgm_hub_03,hgain3,3000)
	}
	else{
		audio_sound_gain(bgm_hub_03,0.001,3000)
	}


	if hub4=true and global.settings.bgm_volume=true{
		audio_sound_gain(bgm_hub_04,hgain1,3000)
	}
	else{
		audio_sound_gain(bgm_hub_04,0.001,3000)
	}


}