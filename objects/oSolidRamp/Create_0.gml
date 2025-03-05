/// @description Insert description here
// You can write your code in this editor
startindex=image_index
night=false

mask_index=sBlockRampEditorMask

sindex=sBlockRampEditor
if instance_exists(oFlowerDay) or instance_exists(oSpaceDay) or instance_exists(oDunDay) {sindex=sBlockRampEditorDark}


if room=Room100
{if y<room_height/2  {sindex=sBlockRampEditorDark}
if x<1180 and y<540 { sindex=sBlockRampEditorDark}}