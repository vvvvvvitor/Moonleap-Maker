/// @description Insert description here
// You can write your code in this editor
startindex=image_index
night=false

brokenright=instance_place(x+1,y,oBrokenStone)

 brokenleft=instance_place(x-1,y,oBrokenStone)

 brokenup=instance_place(x,y-1,oBrokenStone)

brokendown=instance_place(x,y+1,oBrokenStone)

des=false

time=5

if instance_exists(oFlowerDay) or instance_exists(oSpaceDay) or instance_exists(oDunDay) {image_index=1}

if image_xscale=1
{
image_xscale=choose(-1,1)
if image_xscale=-1 {x+=16}
}

if room=Room100
{if y<room_height/2 {image_index=1}
if x<1180 and y<540 {image_index=1}}