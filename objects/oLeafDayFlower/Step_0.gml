/// @description Insert description here
// You can write your code in this editor

vsp=approach(vsp,0.5,0.05)
hsp=approach(hsp,0,0.05)

if image_index > image_number - image_speed image_speed = -1;
if image_index + image_speed < 0 image_speed = 1;

x+=hsp
y+=vsp