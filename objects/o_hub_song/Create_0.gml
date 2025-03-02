/// @description Insert description here
// You can write your code in this editor

image_speed=0.25

event_inherited()

normal=false
final=false

if audio_is_playing(bgm_hub) {exit;}

	audio_play_bgm(bgm_hub   ,true,0)
	audio_play_bgm(bgm_hub_01,true,0)
	audio_play_bgm(bgm_hub_02,true,0)
	audio_play_bgm(bgm_hub_03,true,0)
	audio_play_bgm(bgm_hub_04,true,0)
	
	audio_sound_gain(bgm_hub   ,0.001,0)
	audio_sound_gain(bgm_hub_01,0.001,0)
	audio_sound_gain(bgm_hub_02,0.001,0)
	audio_sound_gain(bgm_hub_03,0.001,0)
	audio_sound_gain(bgm_hub_04,0.001,0)
	
	
	//gain defined on oCamera -> Create