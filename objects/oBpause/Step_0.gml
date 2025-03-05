/// @description Insert description here
// You can write your code in this editor

if os_type!=os_ios and os_type!=os_android {visible=false exit;}
if instance_exists(oMenu) or instance_exists(oPauseMenu) or instance_exists(oIntro) {visible=false exit;}
visible=true
//visible=global.settings.buttons
depth = -9999;

//x = camera_get_view_x(view_camera[0]) + xstart;
//y = camera_get_view_y(view_camera[0]) + ystart;

//show_debug_message(string(y));



image_index=0
key_start=false

if mouse_check_button_pressed(mb_left)
{
	 if collision_point(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id, true, false)
	 {
	key_start=true
	image_index=1
	 }
}






