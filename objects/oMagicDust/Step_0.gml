/// @description Insert description here
// You can write your code in this editor

dir=point_direction(x,y,xx,yy)
x+=lengthdir_x(spd,dir)
y+=lengthdir_y(spd,dir)


life-=1

if life<0
{image_xscale=approach(image_xscale,0,0.1) image_yscale=approach(image_yscale,0,0.1)
	if image_xscale=0 {instance_destroy()}
	}
else{image_xscale=approach(image_xscale,1,0.1) image_yscale=approach(image_yscale,1,0.1)}












