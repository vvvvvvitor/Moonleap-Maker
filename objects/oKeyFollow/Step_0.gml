/// @description Insert description here
// You can write your code in this editor
wavevar=round(wave(-2,1,current_time/1000));

if instance_exists(oPlayer)
{
	x=smooth_approach(x,oPlayer.x - 8*oPlayer.image_xscale,0.05) 
	y=smooth_approach(y,oPlayer.y,0.05)
	
	if wait!=0 {wait-=1 exit;}
	if oPlayer.key=0 {instance_destroy()}
	
	if x<oPlayer.x {image_xscale=1} else {image_xscale=-1}
}

