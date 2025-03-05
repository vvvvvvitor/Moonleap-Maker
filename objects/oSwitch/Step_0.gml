/*
if (gamepad_button_check_pressed(global.switch_controller_id,gp_shoulderl)) {
	with (oCamera) {
		if (debug==true) {debug=false; show_debug=false} else {debug=true; show_debug=true}
	}
}

if (gamepad_button_check_pressed(global.switch_controller_id,gp_shoulderlb)) {
	with (oPlayer) {
		if (oCamera.debug==true) {godmode=!godmode}
	}
}