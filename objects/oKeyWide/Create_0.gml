/// @description Insert description here
// You can write your code in this editor
wavevar=floor(wave(-2,1,current_time/1000));
night=false
change=false
tall=false
wide=true
sprite_index=sKey



palette_index=0

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














