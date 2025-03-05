/// @description Insert description here
// You can write your code in this editor
if os_type!=os_ios and os_type!=os_android {visible=false exit;}
image_index=keyboard_check(vk_space)
depth = -99999;

//x = camera_get_view_x(view_camera[0]) + xstart;
//y = camera_get_view_y(view_camera[0]) + ystart;

/*
image_index=0
key_jump=false

if mouse_check_button_pressed(mb_left) 
{
	 if collision_point(mouse_x, mouse_y, id, true, false)
	 {
	key_jump=true
	image_index=1
	 }
}


if mouse_check_button(mb_left)
{
	 if collision_point(mouse_x, mouse_y, id, true, false)
	 {
	image_index=1
	 }
}










