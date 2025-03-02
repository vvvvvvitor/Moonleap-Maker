/// @description Insert description here

scr_inputget();
// You can write your code in this editor
	drawx=random_range(-(holding),(holding))
	drawy=random_range(-(holding),(holding))
	drawtarget=0

//lerp play button position to be visible in play state
if image_index=6 { //play button
	
	if instance_exists(oPause) //editor is opened 
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



if collision_point(global.level_maker_mouse_x,global.level_maker_mouse_y,self,false,false) //if mouse hover
{
	var mpress=mouse_check_button_pressed(mb_left)
	switch (image_index)
	{
	case 1:  oLevelMaker.hover_text= LANG.maker_change_up			;break;
	case 2:  oLevelMaker.hover_text= LANG.maker_change_down		;break;
	case 3:  oLevelMaker.hover_text= LANG.maker_menu				;break;
	case 4:  oLevelMaker.hover_text= LANG.maker_savemenu			;break;
	case 5:  oLevelMaker.hover_text= LANG.maker_load				;break;
	case 6:  oLevelMaker.hover_text= LANG.maker_play				;break;
	case 7:  oLevelMaker.hover_text= LANG.maker_help				;break;
	case 8: //get style text
	switch (oLevelMaker.style_selected)
	{
	case 0: stext=LANG.maker_grassstyle break;
	case 1: stext=LANG.maker_cloudstyle break;
	case 2: stext=LANG.maker_flowerstyle break;
	case 3: stext=LANG.maker_spacestyle break;
	case 4: stext=LANG.maker_dungeonstyle break;
	}
	oLevelMaker.hover_text= LANG.maker_change_level_style +":\n"+ stext
	
	;break;
	case 9:  oLevelMaker.hover_text= LANG.maker_eraser				;break;
	case 10: oLevelMaker.hover_text= LANG.maker_erase_level			;break;
	}
	if oLevelMaker.cursor!=3 {oLevelMaker.cursor=2}	
	
	if (mouse_check_button(mb_left))
	{
		drawplus=2
	}
	
}
else {holding=0 var mpress=false}


//erase function
if image_index=10
{
	if (mouse_check_button(mb_left))
	{
		holding+=0.05
		if holding=4 { audio_play_sfx(sfx_luano_death_pause_01,false,-8.79,5) room_restart() }
	}
	else
	{holding=0}

}



//ALL THE FUNCTIONS 


if image_index=0 and (mpress=true ) {}

if image_index=1 and (mpress=true or key_down or mouse_wheel_down() ) //up
{
	with(oLevelMaker)
	{
	yplus=-4
    currentx-=1
	repeat(maxx) {if currentx<0 {currentx=selectmaxx} if curobj=noone currentx-=1}
	audio_play_sfx(snd_morcego_02,false,-20,13)
	oButtonMakerObj.drawplus=-1
	}
}

if image_index=2 and (mpress=true or key_up or mouse_wheel_up()) { //down
	
	with(oLevelMaker)
	{
	yplus=+4
    currentx+=1
	repeat(maxy) {if currentx>selectmaxx {currentx=0} if curobj=noone currenty+=1}
	audio_play_sfx(snd_morcego_02,false,-20,13)
	oButtonMakerObj.drawplus=+1
	}
}

if image_index=4 and (mpress=true or (keyboard_check(vk_lcontrol) and keyboard_check_pressed(ord("S"))))  //save
{
	audio_play_sfx(sndUiChange,false,-18.3,1)
	//d_levelName = get_string_async("Level name","Level_0");
	d_levelName = get_save_filename("*.moonlevel","mylevel");
	if(d_levelName != "") {save_level(d_levelName)}
	
}

 if image_index=5 and (mpress=true ) //load
{
	audio_play_sfx(sndUiChange,false,-18.3,1)
	//d_loadLevel = get_string_async("Level name","Level_0");
	d_loadLevel = get_open_filename("*.moonlevel","mylevel");
	if(d_loadLevel != "") { load_level(d_loadLevel)}
}

if image_index=6 and (mpress=true or keyboard_check_pressed(vk_space)) { //test
	
	audio_play_sfx(sndUiChange,false,-18.3,1)
	if instance_exists(oPause) //editor is opened 
	{
		
		with(oLevelMaker){
			if(object_of_type_exists_in_editor(oPlayer) || object_of_type_exists_in_editor(oPlayerDir) || object_of_type_exists_in_editor(oPlayerNeutral) || object_of_type_exists_in_editor(oPlayerEnding))
			{var haveplayer=true}
			else
			{var haveplayer=false; show_message_async(LANG.maker_noplayer)}
			
			if(object_of_type_exists_in_editor(oStar) || object_of_type_exists_in_editor(oStarColor) || object_of_type_exists_in_editor(oStarRunning) || object_of_type_exists_in_editor(oStarRunningColor)  || object_of_type_exists_in_editor(oStarFly) || object_of_type_exists_in_editor(oStarColorNight))
			{var havestar=true}
			else
			{var havestar=false; show_message_async(LANG.maker_noestar)}
			
			if haveplayer and havestar {start_level()}
		}

	}  else {
		
		with(oLevelMaker){
			end_level_and_return_to_editor();
		}
	}
}

if image_index=7 and (mpress=true ) { //help
	audio_play_sfx(sndUiChange,false,-18.3,1)
	
	show_message_async(LANG.maker_help_text)
//if !instance_exists(oMakerWarn)
//{instance_create_layer(x,y,layer,oMakerWarn,{text: LANG.maker_help_text})}
}

if image_index=8 and (mpress=true )
{
	audio_play_sfx(sndUiChange,false,-18.3,1)
	with(oLevelMaker)
	{
	style_selected+=1
	if style_selected>=5 {style_selected=0}
	scr_update_style()
	}	
}

 if image_index=9 and (mpress=true ) //eraser
{
	audio_play_sfx(sndUiChange,false,-18.3,1)
	oLevelMaker.cursor=3
}

