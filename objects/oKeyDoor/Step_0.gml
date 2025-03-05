/// @description Insert description here
// You can write your code in this editor

if distance_to_object(oPlayer)<2
{
	if oPlayer.key>0
	{
		instance_destroy() 
		instance_create_layer(x,y,layer,oBigSmoke)
		var sfxcogu=choose(snd_keyopen,snd_keyopen2,snd_keyopen3) audio_play_sfx(sfxcogu,false,-10,2)
		oPlayer.key-=1
		exit;
	}
}



if change=true
{
	var key=instance_create_layer(x,y,layer,oKey)
	key.tall=tall
	key.wide=wide
	instance_destroy();
}






