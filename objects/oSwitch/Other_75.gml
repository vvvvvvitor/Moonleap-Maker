///Detect gamepad changes
var _type = async_load[? "event_type"];
var _index = async_load[? "pad_index"];

if (_type="gamepad discovered") {
	show_debug_message("[switch] discovered joycon id: "+string(_index));
	joycon_status[_index] = 1;
	alarm[3] = 2;
}
else if (_type == "gamepad lost") {
	show_debug_message("[switch] lost joycon id: "+string(_index));
	joycon_status[_index] = -1;
	alarm[3] = 2;
}

