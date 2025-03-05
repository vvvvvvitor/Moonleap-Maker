/// @description Insert description here
// You can write your code in this editor
if image_index>3  {instance_destroy()}

if instance_exists(oPlayer)
{
if oPlayer.hsp=0 {y+=0.7} else {y+=0.5}
if oPlayer.vsp<0 {vsp=oPlayer.vsp/1.25}
y+=vsp
if distance_to_point(oPlayer.x,oPlayer.y+4)>8{instance_destroy()}
}










