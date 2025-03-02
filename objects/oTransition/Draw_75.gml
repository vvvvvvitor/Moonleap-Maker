/// @description Insert description here
// You can write your code in this editor

var nice_black=make_color_rgb(0,0,72);
var nice_white=make_color_rgb(170,255,255)
var nice_blue=$FFFFAA55
if wait!=0 {draw_clear(nice_black)}

//if(room=RoomProgress){exit;}
for (var yy=0; yy<=ymax; ++yy) {
	for (var xx=0; xx<=xmax; ++xx) {
		draw_sprite_ext(spr, min(max(0, sub_image_index - xx),imax -1), xx * sprh, yy* sprh,1,1,0,nice_black,1)
	}
}

nox_set_alternative_color(nice_blue,"#")

if drawname>6 or drawname<5 {draw_set_color(nice_blue)} else {draw_set_color(nice_white)}

if drawname>0
{
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	var roomname=LANG[$ room_get_name(room)]
//	draw_text(320/2,180/2,string(roomname))
	draw_text_nox(320/2,180/2,string(roomname),0,12,320,false,1)
}

if drawskip>6 or drawskip<5 {draw_set_color(nice_blue)} else {draw_set_color(nice_white)}

if drawskip>0
{
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(320/2,180/2,LANG.text_skip)
}

//draw_text(mouse_x,mouse_y,wait)