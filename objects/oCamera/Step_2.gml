//{freeze_game(8.333333)}

if room=RoomMaker0 {
	camera_set_view_size(view_camera[0],426,240)
	camera_set_view_pos(view_camera[0],-53,-53)	
} else {
	camera_set_view_size(view_camera[0],view_width,view_height)
	camera_set_view_pos(view_camera[0],x+random_range(-shake,shake),y);	
}

if (hubcheck) {
	
	with (oRopeSegment) {
		visible = in_hub_view();
	}
	with (oSolidInv) {
		visible = in_hub_view();
	}
	with (oSolid) {
		visible = in_hub_view();
	}
	with (oPortal) {
		visible = in_hub_view();
	}

	if instance_exists(oPlayer){
		if oPlayer.y<room_height/2 { nice_black=c_black; } else {nice_black=make_color_rgb(0,0,72)}
	}

	hubcheck = false;
	
	show_debug_message("hubcheck");
}

//if fpscap=true 
