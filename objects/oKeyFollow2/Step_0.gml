/// @description Insert description here
// You can write your code in this editor
wavevar=round(wave(-2,1,current_time/1000));

if instance_exists(oKeyFollow)
{
	x=smooth_approach(x,oKeyFollow.x  - 8*oKeyFollow.image_xscale,0.05)
	y=smooth_approach(y,oKeyFollow.y,0.05)
	if x<oKeyFollow.x {image_xscale=1} else {image_xscale=-1}
}

if wait!=0 {wait-=1 exit;}
if instance_exists(oPlayer)
{
	if oPlayer.key=1 {instance_destroy()}
	
	
}