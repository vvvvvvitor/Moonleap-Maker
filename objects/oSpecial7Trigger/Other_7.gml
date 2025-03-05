/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x,y,oPlayer)){
	
	if !instance_exists(oProgress) {exit;}
	
	if oProgress.porcentagem>=1000
	{with(instance_create_layer(oCamera.x+(320/2),oCamera.y+(180/2),"Instances_2",oSuperStar)){starnumber=7} star=16 instance_destroy()}
	else {instance_destroy()}
	
}