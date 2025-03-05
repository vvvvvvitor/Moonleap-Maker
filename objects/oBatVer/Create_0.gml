/// @description Insert description here
// You can write your code in this editor


wing=2

if place_meeting(x+1,y,oBatVer) or place_meeting(x+1,y,oMush)
{wing=1}

if place_meeting(x-1,y,oBatVer)
{wing=-1}

if place_meeting(x+1,y,oBatVer) and  place_meeting(x-1,y,oBatVer)
{wing=0}

dir=image_xscale
image_xscale=1

if image_index=1 {hsp=0.5} else {hsp=-0.5}

startindex=image_index
//if image_index=0 {sprite_index=sLadyNight} else {sprite_index=sLadyDay}



night=false

hsp=0
vsp=0

cx = 0;
cy = 0;



layer=layer_get_id("Instances_2")
drawy=y

prehsp=hsp

xx=x
yy=y

change=false

if instance_exists(oGrassDay)
{palette_index=0 exit;}

if instance_exists(oCloudDay)
{palette_index=1 exit;}

if instance_exists(oFlowerDay)
{palette_index=2 exit;}

if instance_exists(oSpaceDay)
{palette_index=3 exit;}

if instance_exists(oDunDay)
{palette_index=4 exit;}

image_index=0