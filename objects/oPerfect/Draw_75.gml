
draw_set_font(fntSmall)

		var c1=make_color_rgb(42,57,106)
		var c2=make_color_rgb(121,155,175)
		var c3=make_color_rgb(170,255,255)

		if ceil(time)=1		{draw_set_color(c1)}
		if ceil(time)=2		{draw_set_color(c2)}
		if ceil(time)>=3	{draw_set_color(c3)}
		


nox_set_wave(2.25, 0.75, 1, "~") //fast wave

		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)

		draw_text_nox(320/2,16,"~"+"perfect"+"~",0,12,320,false,1)
		




