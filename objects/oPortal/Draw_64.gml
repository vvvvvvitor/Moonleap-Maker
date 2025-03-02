/// @description Insert description here
// You can write your code in this editor


if wait=2
{
	
nox_set_wave(2.25, 1, 100, "~") //full slow wave
//nox_set_wave(2.25, 0.75, 1, "~") //fast wave

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
		
		var roomname=LANG[$ room_get_name(level)]
		
		draw_text_nox(320/2,180-16,"~"+string(roomname)+"~",0,12,320,false,1)
		

		if debug
		{
			switch rank
			{
				case 0: var rankletter="IDK"  break;
				case 1:	var rankletter="D"	break;
				case 2:	var rankletter="C"	break;
				case 3:	var rankletter="B"	break;
				case 4:	var rankletter="A"	break;
				case 5:	var rankletter="S"	break;
			}
			var thislevel=string_insert(level_index,"Room",5)
				draw_text_nox(320/2,16,"~"+thislevel+"       "+string(scor)+" / "+string(perfectscore)+"   rank: "+rankletter+"~",0,12,320,false,1)
		}

		//draw_text(320/2,180-16,"level desbloqueado       recorde de pulos: 5")
	
	}
}