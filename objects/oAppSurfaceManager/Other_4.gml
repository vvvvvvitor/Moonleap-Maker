if(room == RoomMaker0){
	current_application_display_width = EDITOR_VIEW_WIDTH;
	current_application_display_height = EDITOR_VIEW_HEIGHT;
} else {
	current_application_display_width = GAME_SCREEN_WIDTH;
	current_application_display_height = GAME_SCREEN_HEIGHT;
}

//if changed then update
if(surface_get_width(application_surface) != current_application_display_width
or surface_get_height(application_surface) != current_application_display_height){
	
	surface_resize(application_surface, current_application_display_width, current_application_display_height);
}