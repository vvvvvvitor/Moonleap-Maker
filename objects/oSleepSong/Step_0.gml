/// @description Insert description here
// You can write your code in this editor
if instance_exists(oPlayer)
{
	
			if oPlayer.sprite_index=oPlayer.PlayerSit and oPlayer.image_index>(oPlayer.image_number-1)
		{
		audio_group_set_gain(agroup_bgm,0,2000)
		}
	
	if oPlayer.sprite_index=oPlayer.PlayerSit and oPlayer.image_index>(oPlayer.image_number-0.75)
	{
		if !audio_is_playing(sndLullaby)
		{
			audio_play_sound(sndLullaby,30,false) play=true
			
		}
	}		
}
else
{
audio_group_set_gain(agroup_bgm,global.settings.bgm_volume,2000)
}

if play=true and !audio_is_playing(sndLullaby)
{ audio_group_set_gain(agroup_bgm,global.settings.bgm_volume,2000) instance_destroy()}