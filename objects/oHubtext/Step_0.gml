/// @description Insert description here
// You can write your code in this editor
drawinfo=point_in_rectangle(oCamera.x+160,oCamera.y+90,x,y,x+sprite_width,y+sprite_height)

if instance_exists(oPauseMenu) {drawinfo=false}

if drawinfo=true  { bright=approach(bright,3,0.25)}
if drawinfo=false and bright!=0 {bright=approach(bright,0,0.25)}

