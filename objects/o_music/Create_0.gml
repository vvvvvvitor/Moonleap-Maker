persistent=true

pos=0
total_len=100000
bgm=undefined

with (o_music) 
{
	if (id != other.id) //if actual song is diferent from current song, change song
	{
		audio_stop_sound(bgm)
		instance_destroy();
		
		if image_speed=0.25 //this check if this is the hub, hub is the only one with mltiple audio channels
		{
			audio_stop_sound(bgm_hub   )
			audio_stop_sound(bgm_hub_01)
			audio_stop_sound(bgm_hub_02)
			audio_stop_sound(bgm_hub_03)
			audio_stop_sound(bgm_hub_04)
			instance_destroy();
		}
	}
}




