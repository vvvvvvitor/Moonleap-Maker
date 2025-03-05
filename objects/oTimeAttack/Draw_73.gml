/// @description Insert description here
// You can write your code in this editor

if room!=RoomMenu
{
var nice_magenta=make_color_rgb(170,170,255)
draw_set_font(oCamera.font)
draw_set_color(nice_magenta)
//draw_text(320-16,4,round(time))
draw_sprite_part(sHearts,0,0,0,sprite_width-((-(hearts-20))*4.5),sprite_height,121+((-(hearts-20))*2.25),6)
}
