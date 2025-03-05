

if !instance_exists(oIntro) {
	scr_inputget();
}

/*
if oCamera.arcade=true {
	
if key_start+key_left+key_down+key_up+key_right!=0 {timer=0}
	
	timer+=0.1
	if timer=600 {video_open("moonleaptrailergame.mp4")}/////////////checkthis
	video_enable_loop(true)

_data = video_draw();
 _status = _data[0];

if (_status == 0)
{if key_start+key_left+key_down+key_up+key_right!=0 {video_close() timer=0 key_start=false key_up=false key_down=false}}

}
*/

//segmento útil pra fazer o texto selecionado balanãr
wavevar=floor(wave(-1,1,current_time/1000));

if (key_up==true or (key_up_axis_pressed and !key_axis_pressed)) and (option_index > 0) {
	option_index -= 1;
	audio_play_sfx(sndUiChange,false,-18.3,1);
}

if (key_down==true or (key_down_axis_pressed and !key_axis_pressed)) and (option_index < (array_length(menu)-1)) {
	option_index += 1;
	audio_play_sfx(sndUiChange,false,-18.3,1);
	
}

option = menu[option_index];

if (key_start==true or key_jump_pressed==true) and !instance_exists(oTransition) {
	if option.name != "sure?" {audio_play_sound(sndUiChange,1,false,0.20*(global.settings.enable_sfx),0,1.4)}
	
	
	shake_gamepad(0.4,2);
	var _action = method(id,option.action);
	_action(); //run the action for the currently selected option
}

oCamera.pause_delay=10;


	if(keyboard_string == "05081999debugmode")
	{
		oCamera.debug=true
		audio_play_sound(sndUiChange,10,false,(power(10, -18.2/20))*(global.settings.enable_sfx),0,1.4)
		keyboard_string = "";
	}
