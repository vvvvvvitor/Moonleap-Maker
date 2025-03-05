/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_set_font(font_console)
draw_set_color(nice_black)
draw_set_alpha(0.9)
draw_rectangle(-100,-100,1000,1000,false)
draw_set_alpha(1)
draw_set_color(nice_white)
draw_text(room_width/2,room_height/2,text)
draw_set_font(fntSmall)