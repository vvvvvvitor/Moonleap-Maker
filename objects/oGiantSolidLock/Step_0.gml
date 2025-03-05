/// @description Insert description here
// You can write your code in this editor


if wait=0
{
	image_speed=0
	number=0

	for (var i = 0; i < 60; i += 1)

	{
		r[i]= variable_struct_get(oSaveManager.struct_main,string_insert("r",i,0))
		number+=ceil(r[i])
	}
	
}

wait=0


if !instance_exists(oPlayer) {exit;}


if point_distance(xstart,ystart+64,oPlayer.x,oPlayer.y+8)<90
{

image_index=approach(image_index,number,0.25)

if image_index!=number and y!=ystart-64 and image_index!=0
{if !audio_is_playing(snd_porta_pedra_grande) {audio_play_sfx(snd_porta_pedra_grande,false,-13,0)}}


if (image_index=number and number<=35) or !(y!=ystart-64 and image_index!=0)
{ {audio_stop_sound(snd_porta_pedra_grande)}}

	if image_index>=36
	{
		y=approach(y,ystart-64,0.25)
		

			if(!steam_get_achievement("MN_WORLD_4")){steam_set_achievement("MN_WORLD_4");
			GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQBg");}
			
		if y!=ystart-64
		{
			oCamera.shake=1
			shake_gamepad(0.25,1)
		}
		else
		{
		}
	}

}
else
{
	if image_index!=0 {audio_stop_sound(snd_porta_pedra_grande)}
	image_index=approach(image_index,0,0.5)
}




