/// @description Insert description here
// You can write your code in this editor

if wide=false and  tall=false {draw_sprite(sKeyDoorNot,0,x,y)}
if wide=true  and  tall=false {draw_sprite(sKeyDoorWideNot,0,x,y)}
if tall=true  and  wide=false {draw_sprite(sKeyDoorTallNot,0,x,y)}
if tall=true  and  wide=true  {draw_sprite(sKeyDoorTallWideNot,0,x,y)}

draw_sprite(sprite_index,image_index,x,y+1+wavevar)