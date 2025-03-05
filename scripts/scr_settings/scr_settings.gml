global.settings = {
	filter: false,
	enable_sfx: true,
	bgm_volume: true,
	gamespd: 100,
	deaths: 0,
	vibration: 0.5,
	window_scale: 3,
	fullscreen: false,
	buttons: 50
};

if os_type=os_switch or os_type=os_macosx
{
global.settings.vibration=0.2
}

#macro SETTINGS global.settings
global.audio_list=ds_list_create()


function bgm_set_volume(_volume) {
	
	//_volume = round(_volume); //force it to 0 or 1
	
	

	global.settings.bgm_volume = _volume;
	
	audio_group_set_gain(agroup_bgm,_volume,0)
	
	audio_sound_gain(bgm_hub_01,0.001,0)
	audio_sound_gain(bgm_hub_02,0.001,0)
	audio_sound_gain(bgm_hub_03,0.001,0)
	audio_sound_gain(bgm_hub_04,0.001,0)
	
	
	/*
	container_set_volume("BgmIntro",_volume)

	//container_set_volume("BgmHubOnlyOne",_volume)
	
	if (_volume == 0) {
		container_set_volume("BgmHub",_volume)
		container_set_volume("BgmHub1",_volume)
		container_set_volume("BgmHub2",_volume)
		container_set_volume("BgmHub3",_volume)
		container_set_volume("BgmHub4",_volume)
	}
	
	container_set_volume("BgmGrass",_volume)
	container_set_volume("BgmGrassNight",_volume)
	
	container_set_volume("BgmSpace", _volume)
	container_set_volume("BgmSpaceNight", _volume)
	
	container_set_volume("BgmCloud",_volume)
	container_set_volume("BgmCloudNight",_volume)
	
	container_set_volume("BgmFlower",_volume)
	container_set_volume("BgmFlowerNight",_volume)
	
	if (room == Room100) {
		with (ohubaudiocontrol) {
			col = false;	
		}
	}
	*/
}

