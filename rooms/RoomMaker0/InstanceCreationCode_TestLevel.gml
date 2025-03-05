shortcuts = [vk_space]

pressed = function() {
	audio_play_sfx(sndUiChange,false,-18.3,1)
	if global.game_state == GameState.EDITING //editor is opened 
	{
		show_debug_message("Going in!")
		
		with(oLevelMaker){
			var has_player = (object_of_type_exists_in_editor(oPlayer) || object_of_type_exists_in_editor(oPlayerDir) || object_of_type_exists_in_editor(oPlayerNeutral) || object_of_type_exists_in_editor(oPlayerEnding))			
			var has_stars = (object_of_type_exists_in_editor(oStar) || object_of_type_exists_in_editor(oStarColor) || object_of_type_exists_in_editor(oStarRunning) || object_of_type_exists_in_editor(oStarRunningColor)  || object_of_type_exists_in_editor(oStarFly) || object_of_type_exists_in_editor(oStarColorNight))

			if has_player && has_stars {
				start_level()
				
			} else { 
				audio_play_sfx(snd_kick, false, -18.3, 1) 
			}
		}
	}  else {
		if global.game_state == GameState.TESTING {
			show_debug_message("Going back!")
			with(oLevelMaker){
				end_level_and_return_to_editor();
			}
		}
	}
}

//if image_index=6 { //play button
//	if instance_exists(oPause) //editor is opened 
//	{
//		x = lerp(x,start_pos_x,.2);
//		y = lerp(y,start_pos_y,.2);
		
//		image_xscale = lerp(image_xscale,1,.2);
//		image_yscale = image_xscale;
//	} else {
	
//		x = lerp(x,(32-small_size)/2,.2);
//		y = lerp(y,room_height-16-small_size/2,.2);

//		image_xscale = lerp(image_xscale,small_size/32,.2);
//		image_yscale = image_xscale;
//	}

//} else {
	
//	if !instance_exists(oPause) {exit}

//}