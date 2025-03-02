/// @description Draw Menu


draw_set_halign(fa_center);
draw_set_valign(fa_top);


draw_set_font(oCamera.font);
nox_set_wave(2.25, 0.75, 1, "~")

var nice_magenta=make_color_rgb(85,85,255);
var nice_yellow=make_color_rgb(85,170,255);
//var nice_black=make_color_rgb(0,0,72);


nox_set_alternative_color($FFFFFFAA,"#") //moonleaps white

var _menu_ops = array_length(menu);
var _menu_y_gap = 14;
var _yy = 78;//104-ceil(_menu_ops/2)*_menu_y_gap;

draw_set_color($FFAA0055);
draw_text(320-21,162,"v"+string_copy(GM_version,1,5))

for (var _i = 0; _i < _menu_ops; ++_i) {
    var _menu_option = menu[_i];
	draw_set_color((option_index == _i) ? nice_yellow : nice_magenta);
	//var drawwavevar=wavevar * (option_index== _i)
	if option_index==_i
	{
		if (menu == menus.deletesure)
		{draw_text_nox(160,_yy+(_menu_y_gap*_i),"$"+ _menu_option.text() +"$",0,12,320,false,1)
			} //shake
		else
		{draw_text_nox(160,_yy+(_menu_y_gap*_i),"~"+ _menu_option.text() +"~",0,12,320,false,1)
			} //wave
	}
	else
	{draw_text_nox(160,_yy+(_menu_y_gap*_i), _menu_option.text(),0,12,320,false,1)
		}
	//draw_text(160,_yy+drawwavevar+(_menu_y_gap*_i), _menu_option.text());
}

if (menu == menus.assist)
{
	draw_set_color(nice_yellow);
	if (option.name == "colorblind") {
		draw_text(160,140,LANG.text_full_colorblind);
	}
	if (option.name == "gamespeed") {
		draw_text(160,140,LANG.text_full_speed);
	}
}

if (menu == menus.deletesure)
{
	draw_set_color(nice_yellow);
	if (option.name == "yes") {
		draw_text_nox(160,140,"#"+LANG.text_savecaution+"#",0,12,320,false,1)
	}
}



