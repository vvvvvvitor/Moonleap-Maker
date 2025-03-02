/// @description Insert description here
// You can write your code in this editor
if wait=2
{

	if ceil(bright)>=1
	{
		
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)

		var c1=make_color_rgb(42,57,106)
		var c2=make_color_rgb(121,155,175)
		var c3=make_color_rgb(170,255,255)

		if ceil(bright)=1 {draw_set_color(c1)}
		if ceil(bright)=2 {draw_set_color(c2)}
		if ceil(bright)=3 {draw_set_color(c3)}
		
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
	
		var roomname=LANG[$ room_get_name(level)]
		draw_text(320/2,180-16,string(roomname))
	
		//draw_text(320/2,180-16,"level desbloqueado       recorde de pulos: 5")
	
	}
}