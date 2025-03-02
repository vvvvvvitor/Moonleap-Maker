/// @description Insert description here
// You can write your code in this editor
time-=1

shake=approach(shake,0,0.1)
x=random_range(xstart-shake,xstart+shake)
//y=random_range(ystart-shake,ystart+shake)

if image_index>11 {instance_destroy()}