///@desc switch input check

var _joycon_changed = false;
for (var _s = 0; _s < 8; ++_s) {
    if (joycon_status[_s] != 0) {		
		show_debug_message("[switch] joycon changed: "+string(_s));
		
		//if new joycon added, or current one is lost
		if (joycon_status[_s] == 1) or ((joycon_status[_s] == -1) && (_s == global.switch_controller_id)) {
			_joycon_changed = true;
		}
	}
	
	joycon_status[_s] = 0;
}

if (_joycon_changed) {
	input_switch_set_controller();
}