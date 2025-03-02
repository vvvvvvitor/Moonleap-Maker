/// @description Insert description here
// You can write your code in this editor

startindex=image_index
night=false

if instance_exists(oFlowerDay) or instance_exists(oSpaceDay)  or instance_exists(oDunDay)  {image_index=5}

if room=Room100
{if y<room_height/2 {image_index=5}
if x<1180 and y<540 {image_index=5}}