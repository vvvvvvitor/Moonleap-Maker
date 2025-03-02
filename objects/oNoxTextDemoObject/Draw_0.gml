nox_text_init();

switch (demo_number)
{
	case 0:
	{
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);
		draw_set_font(fNoxTextDemoFont)
		nox_text_init()
		nox_set_outline(true,c_black,4);
		
		draw_text_nox(room_width/2,room_height/2,"With this @Function@ you can easily draw #text# with @~cool~ *visual* effects@ for your $games$!!!||*Bold*|~Wavey~|@Rainbow@|$Shake$|#Alternative colors#||~apply all those effects using @one@ single *string*!~",
		3.3,55,1000);
	}
	break;
	case 1:
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_set_font(fNoxTextDemoFont2)
		nox_text_init()
		nox_set_outline(false,c_black,4);
		draw_set_color(c_white);
		
		nox_set_alternative_color(merge_color(c_maroon,c_black,0.4));
		nox_set_wave(7,1.4,0.8)
		
		var _text = ["*bold*","~wave~","$shake$","@rainbow@"];
		
		for (var i = 0; i < array_length(_text); i++)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			
			var yy = (room_height/(array_length(_text)+1))*(i+1);
			
			draw_text(60,yy,_text[i]+"  >  ");
			draw_text_nox(60+string_width(_text[i]+"  >  "),yy,_text[i],
			3.3,55,10000);
			
		}
	}
	break;
	case 2:
	{
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);
		draw_set_font(fNoxTextDemoFont)
		nox_set_outline(true,c_black,4);
		draw_set_color(c_white);
		
		nox_set_alternative_color(merge_color(c_maroon,c_black,0.4));
		nox_set_wave(7,1.4,0.8)
		
		draw_text(room_width/2,room_height/3,"The $quick$ #brown# fox @jumps@ over the ~lazy~ *dog*");
		
		draw_text_nox(room_width/2,room_height-room_height/3,"The $quick$ #brown# fox @jumps@ over the ~lazy~ *dog*",
		3.3,55,10000);
	}
	break;
	case 3:
	{
		nox_text_init();
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_set_font(fNoxTextDemoFont)
		nox_set_outline(true,c_black,4);
		nox_set_alternative_color(merge_color(c_lime,c_black,0.6))
		draw_set_color(c_aqua);
		
		draw_text_nox(80,room_height/4,"//Fully #commented# code!",
		3.3,55,10000);
		
		draw_text_nox(80,(room_height/4)*2,"Each effect is ~highly~ configurable!",
		3.3,55,10000);
		
		nox_set_shake(1)
		draw_text_nox(80,(room_height/4)*3,"$Easy$ implementation for @GUI@ and @dialogue boxes@!",
		3.3,55,10000);
	}
	break;
}


demo_number += keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left);
demo_number = clamp(demo_number,0,3);