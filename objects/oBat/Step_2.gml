/// @description Insert description here
// You can write your code in this editor
scr_moving_plat()

if instance_exists(oPauseMenu) {exit;} 

if change=true and hsp=0
{
	xx+=16*dir
	change=false
}

