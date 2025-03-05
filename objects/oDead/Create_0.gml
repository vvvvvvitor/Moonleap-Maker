/// @description Insert description here
// You can write your code in this editor
time=2
shake=2
oCamera.shake=3
shake_gamepad(1,20)



global.settings.deaths+=1;

show_debug_message(string(global.settings.deaths));
//global.settings.deaths


if instance_exists(oNeutralFlag) 
{neutral=true}