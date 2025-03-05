/// @description Insert description here
event_inherited()

scr_inputget();
// You can write your code in this editor
	drawx=random_range(-(holding),(holding))
	drawy=random_range(-(holding),(holding))
	drawtarget=0

//lerp play button position to be visible in play state
if always_visible { //play button
	if global.game_state == GameState.EDITING //editor is opened 
	{
		x = lerp(x,start_pos_x,.2);
		y = lerp(y,start_pos_y,.2);
		
		image_xscale = lerp(image_xscale,1,.2);
		image_yscale = image_xscale;
	} else {
	
		x = lerp(x,(32-small_size)/2,.2);
		y = lerp(y,room_height-16-small_size/2,.2);

		image_xscale = lerp(image_xscale,small_size/32,.2);
		image_yscale = image_xscale;
	}

} else {
	
	if !instance_exists(oPause) {exit}

}



if is_hovering() //if mouse hover
{
	var mpress=mouse_check_button_pressed(mb_left)
	
	if oLevelMaker.cursor!=3 {oLevelMaker.cursor=2}	
	
	if (mouse_check_button(mb_left))
	{
		drawplus=2
	}
	
}
else {holding=0 var mpress=false}

