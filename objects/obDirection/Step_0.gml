/// @description Insert description here
// You can write your code in this editor
//if os_type!=os_ios and os_type!=os_android {visible=false exit;}

depth = -99999;
if os_type!=os_ios and os_type!=os_android {visible=false exit;}
if instance_exists(oPauseMenu) or instance_exists(oMenu) {sprite_index=sDirection} else {sprite_index=sDirectionSide}

key_left=false
key_right=false
key_up=false
key_down=false

image_index=0


/*
if mouse_check_button_pressed(mb_left)
{
	 if collision_point(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id, true, false)
	 {
		if device_mouse_y_to_gui(0)>y {key_down=true }
		if device_mouse_y_to_gui(0)<y {key_up=true }
	 }	 
}

if mouse_check_button(mb_left)
{
	 if collision_point(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id, true, false)
	 {
		if device_mouse_x_to_gui(0)>x {key_right=true }
		if device_mouse_x_to_gui(0)<x {key_left=true }
	 }
	
	if collision_point(device_mouse_x_to_gui(1), device_mouse_y_to_gui(1), id, true, false)
	 {
		if device_mouse_x_to_gui(1)>x {key_right=true }
		if device_mouse_x_to_gui(1)<x {key_left=true }
	 }
	 
	 	if collision_point(device_mouse_x_to_gui(2), device_mouse_y_to_gui(2), id, true, false)
	 {
		if device_mouse_x_to_gui(2)>x {key_right=true }
		if device_mouse_x_to_gui(2)<x {key_left=true }
	 }
	 
}