/// @description Insert description here
// You can write your code in this editor
if image_angle=90 
{instance_create_layer(x,y,layer,oLadyVer,  {image_index : 1})
instance_destroy() exit;}

if image_angle=270
{instance_create_layer(x,y,layer,oLadyVer,  {image_index : 1})
instance_destroy() exit;}

if image_angle=0
{instance_create_layer(x,y,layer,oLady,  {image_index : 1})
instance_destroy() exit;}

if image_angle=180
{instance_create_layer(x,y,layer,oLady,  {image_index : 1})
instance_destroy() exit;}




