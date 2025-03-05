/// @description  shake_gamepad(intensity,duration)
/// @param intensity
/// @param duration

function shake_gamepad(_intensity, _duration) {
	
	
	//if (!global.settings.vibration) { exit; }
	
	oCamera.shaketime = _duration;
	
	if (os_type == os_switch) {
		_intensity *= global.settings.vibration/2
		gamepad_set_vibration(global.switch_controller_id,_intensity,_intensity);
	}
	else {
		_intensity *= global.settings.vibration;
		gamepad_set_vibration(0,_intensity,_intensity)
		gamepad_set_vibration(1,_intensity,_intensity)
	}
}
