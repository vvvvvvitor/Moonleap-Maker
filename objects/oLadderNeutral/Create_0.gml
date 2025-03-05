/// @description Insert description here
// You can write your code in this editor
image_index=y/16
night=false

levelnumb=real(string_digits(room_get_name(room)))
palette_index=0 

if instance_exists(oFlowerDay) or instance_exists(oSpaceDay)  or instance_exists(oDunDay)  {palette_index=8 }

if room=Room100
{if y<room_height/2 {palette_index=8}
if x<1180 and y<540 {palette_index=8}}


