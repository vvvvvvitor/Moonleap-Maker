/// @description Insert description here
// You can write your code in this editor
if instance_exists(oRoomTransition) or visible=false exit;
xx=random_range(x,x+16)
yy=random_range(y,y+16)
instance_create_layer(xx,yy,"Instances_2",oSpark)
neww=false