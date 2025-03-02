// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrDie(){


if instance_exists(oTimeAttack) {oTimeAttack.hearts-=1} 
shake_gamepad(1,600)
instance_create_layer(x,y,layer,oDead)
instance_destroy()
}