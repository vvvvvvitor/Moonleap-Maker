/// @description Insert description here
// You can write your code in this editor
if !instance_exists(oPlayer) {exit;}

px=oPlayer.x
py=oPlayer.y
angle=point_direction(x,y,px,py)



xx=random_range(x,x+1)
yy=random_range(y,y+1)
spark= instance_create_layer(xx,yy,"Instances_2",oSpark)
spark.image_speed=1.5
spark.image_index=1


x+=lengthdir_x(12,angle)
y+=lengthdir_y(12,angle)

if distance_to_point(px,py)<6 {instance_destroy()}