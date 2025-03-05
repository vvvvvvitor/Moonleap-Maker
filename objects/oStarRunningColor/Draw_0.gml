/// @description Insert description here
// You can write your code in this editor
var xx=round(x)
var yy=round(y)
var roomw=room_width
var roomh=room_height

draw_sprite_ext(sprite_index,image_index,xx,yy,drawscale,image_yscale,0,c_white,1)
draw_sprite_ext(sprite_index,image_index,xx-roomw,yy,drawscale,image_yscale,0,c_white,1)
draw_sprite_ext(sprite_index,image_index,xx+roomw,yy,drawscale,image_yscale,0,c_white,1)

draw_sprite_ext(sprite_index,image_index,xx,yy-roomh,drawscale,image_yscale,0,c_white,1)
draw_sprite_ext(sprite_index,image_index,xx,yy+roomh,drawscale,image_yscale,0,c_white,1)