//draw_text(100,100,previous_room)
//draw_text(100,120,levelnumb)


//draw_self()
//correct color for ultrawide monitors
	draw_set_color(nice_black)
	draw_rectangle(0,-20,-100,190,false)
	draw_rectangle(320,-20,420,190,false)

	draw_rectangle(-100,180,420,250,false)
	draw_rectangle(-100,0,420,-100,false)
	

if debug=false or show_debug=false or !surface_exists(surfdebug) {exit}

surface_set_target(surfdebug)

draw_clear_alpha(c_black, 0);

var displayw = 1600
var displayh = 900
var dfrac= displayh/35

//draw_sprite_tiled_ext(sDebugGrid,0,0,0,1,1,c_white,0.5)

draw_set_font(fntArial)
draw_set_valign(fa_center)
	
draw_set_color(c_white)

draw_set_halign(fa_center)

draw_text(displayw/2,dfrac*1,"DEBUG MODE! Press F1 to Console")

draw_set_halign(fa_left)

draw_text(0+dfrac,dfrac*1,"Real FPS: "+string(round(fps_real)))
draw_text(0+dfrac,dfrac*2,"I, J, K, L to fly")
draw_text(0+dfrac,dfrac*3,"P to hide this")
draw_text(0+dfrac,dfrac*4,"F5 to restart")
draw_text(0+dfrac,dfrac*5,"Actual FPS: "+string(round(fps)))
draw_text(0+dfrac,dfrac*6,"F4 to exit Debug Mode")
draw_text(0+dfrac,dfrac*7,"Active Objects:"+string(instance_count))
draw_text(0+dfrac,dfrac*8,"F6 to enable godmode")

draw_set_halign(fa_right)
draw_text(displayw-dfrac,dfrac*1,  string(global.audio_list[|ds_list_size(global.audio_list)-1])	)
draw_text(displayw-dfrac,dfrac*2,  string(global.audio_list[|ds_list_size(global.audio_list)-2])	)
draw_text(displayw-dfrac,dfrac*3,  string(global.audio_list[|ds_list_size(global.audio_list)-3])	)
draw_text(displayw-dfrac,dfrac*4,  string(global.audio_list[|ds_list_size(global.audio_list)-4])   )
draw_text(displayw-dfrac,dfrac*5,  string(global.audio_list[|ds_list_size(global.audio_list)-5])	)
draw_text(displayw-dfrac,dfrac*6,  string(global.audio_list[|ds_list_size(global.audio_list)-6])	)
draw_text(displayw-dfrac,dfrac*7,  string(global.audio_list[|ds_list_size(global.audio_list)-7])	)
draw_text(displayw-dfrac,dfrac*8,  string(global.audio_list[|ds_list_size(global.audio_list)-8])	)
draw_text(displayw-dfrac,dfrac*9, string(global.audio_list[|ds_list_size(global.audio_list)-9])	)
draw_text(displayw-dfrac,dfrac*10, string(global.audio_list[|ds_list_size(global.audio_list)-10])	)
draw_text(displayw-dfrac,dfrac*11, string(global.audio_list[|ds_list_size(global.audio_list)-11])	)



if instance_exists(o_music)
{
	draw_set_halign(fa_left)
	var pos = audio_sound_get_track_position(o_music.bgm)
	draw_text(0+dfrac,displayh-dfrac*3,audio_get_name(o_music.bgm))
	draw_text(0+dfrac,displayh-dfrac*2,"pos: "+ string(pos))
	draw_text(0+dfrac,displayh-dfrac,"total_len: "+ string(o_music.total_len))
}



/*
for (var i = 0; i < 12; i += 1)
{
	draw_set_halign(fa_right)
	draw_text(displayw-dfrac,dfrac*i,  string(global.audio_list[|ds_list_size(global.audio_list)-i])	)
}
*/


draw_set_font(oCamera.font)

surface_reset_target()


draw_surface_stretched(surfdebug,0,0,320,180)

global.lstStckU = gamepad_axis_value(0, gp_axislv) < -0.4;
global.lstStckD = gamepad_axis_value(0, gp_axislv) > 0.4;
