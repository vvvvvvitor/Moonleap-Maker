/// @description Insert description here
// You can write your code in this editor


repeat(3) {instance_create_layer(x,y,"Instances_2",oBigSmoke)}
	audio_play_sfx(snd_kick,false,-7.3,13)
	
	if instance_exists(oStar) {instance_destroy(oStar)}
	
//var star=instance_create_layer(x,y-8,"Instances_2",oStar)
//star.vsp=-2




