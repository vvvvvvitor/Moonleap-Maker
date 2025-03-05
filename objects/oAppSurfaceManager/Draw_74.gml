//var _gui_width_before = display_get_gui_width();
//var _gui_height_before = display_get_gui_width();
//display_set_gui_size(GAME_SCREEN_WIDTH,GAME_SCREEN_HEIGHT);

var _app_surface_x = 0;
var _app_surface_y = 0;

var _gui_scale_x = display_get_gui_width() / current_application_display_width;
var _gui_scale_y = display_get_gui_height() / current_application_display_height;

with(oLevelMaker){
	
	var _cam_offset_x = camera_get_view_x(view_camera[0]);
	var _cam_offset_y = camera_get_view_y(view_camera[0]);
	
	var _cam_width = camera_get_view_width(view_camera[0]);
	var _cam_height = camera_get_view_height(view_camera[0]);
	
	_app_surface_x = lerp(0, _cam_offset_x, camera_current_interpolation);
	_app_surface_y = lerp(0, _cam_offset_y, camera_current_interpolation);
	
	_gui_scale_x *= lerp(1,  _cam_width/room_width, camera_current_interpolation);
	_gui_scale_y *= lerp(1,  _cam_height/room_height, camera_current_interpolation);
}

draw_surface_ext(application_surface,floor(_app_surface_x * _gui_scale_x),floor(_app_surface_y * _gui_scale_y),_gui_scale_x,_gui_scale_y,0,c_white,1);

//display_set_gui_size(_gui_width_before,_gui_height_before);