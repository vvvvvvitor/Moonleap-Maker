/// @description Insert description here
// You can write your code in this editor
if y<room_height and x<room_width and x>0 and y>0
{
	if image_xscale=1 {instance_create_layer(x+8,y+8,"Instances_2",oBigSmoke)}
	if image_xscale=-1{instance_create_layer(x-8,y+8,"Instances_2",oBigSmoke)}
}

audio_play_sfx(snd_brokestone,false,-3,15);

oCamera.shake=1
shake_gamepad(0.125,2)

if  brokenright!=noone and instance_exists(brokenright) {brokenright.des=true}
if  brokenleft!=noone and instance_exists(brokenleft) {brokenleft.des=true}
if  brokenup!=noone  and instance_exists(brokenup)  {brokenup.des=true}
if  brokendown!=noone and instance_exists(brokendown) {brokendown.des=true}

