/// @description Insert description here
// You can write your code in this editor
maxspd=0.45
mask_index=sprite_index
smove_day=sLadyNight
sturn_day=sLadyTurn

smove_dayB=sLadyDay
sturn_dayB=sLadyTurnNight


if image_index=1 {hsp=spd} else {hsp=-spd}
image_xscale=sign(hsp)
startindex=image_index
if image_index=0 {sprite_index=sLadyNight} else {sprite_index=sLadyDay}


night=false

hsp=0
vsp=0

cx = 0;
cy = 0;

xx=0
yy=0

layer=layer_get_id("Instances_2")
drawy=y

prehsp=hsp
drawhsp=image_xscale

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