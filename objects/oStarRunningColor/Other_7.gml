/// @description Insert description here
// You can write your code in this editor
if instance_exists(oRoomTransition) exit;
xx=random_range(x,x+16)
yy=random_range(y,y+16)
instance_create_layer(xx,yy,"Instances_2",oSpark)

drawscale=image_xscale

var ran=choose(0,2)
if hsp!=0 and ran=0
{
	 {if place_meeting(x,y+1,oGrassDay) {instance_create_layer(x,y+(sprite_height/3),"Instances_2",oLeafDay)}} //folha		
	 {if place_meeting(x,y+1,oGrassNight) {instance_create_layer(x,y+(sprite_height/3),"Instances_2",oLeafNight)}} //folha
	
	 {if place_meeting(x,y+1,oFlowerDay) {instance_create_layer(x,y+(sprite_height/3),"Instances_2",oLeafDayFlower)}} //folha		
	 {if place_meeting(x,y+1,oFlowerNight) {instance_create_layer(x,y+(sprite_height/3),"Instances_2",oLeafNightFlower)}} //folha
} 