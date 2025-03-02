/// @description Insert description here
// You can write your code in this editor
time+=1
if time>10
{
if mouse_check_button_pressed(mb_any) or keyboard_check_pressed(vk_anykey) {instance_destroy()}
}

if time>20{time=20}

yy=smooth_approach(yy,ytarget,0.25)