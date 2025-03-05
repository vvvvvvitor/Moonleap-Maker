/// @description Insert description here
// You can write your code in this editor


image_xscale=choose(-1,1)

if instance_exists(oPlayer)
{hsp=oPlayer.hsp + random_range(-0.5,0.5)}
else
{hsp=random_range(-0.5,0.5)}


vsp=random_range(-0.5,-1)
image_index=random_range(3,7)