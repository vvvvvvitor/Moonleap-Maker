/// @description Insert description here
// You can write your code in this editor

event_inherited()
/*
if wait=0
{
	drawy=94
	level=asset_get_index(string_insert(level_index,"Room",8))

	color=make_color_rgb(0,85,170)


	//check if is the first stage
	var thislevel=string_insert(level_index,"Room",5)
	if thislevel="Room0"
	{overlay_index=1}//open the door
	

	//check if previous level is complete
	var prevlevel=string_insert(level_index-1,"Room",5)
	var levelminusoom=string_replace(prevlevel,"Room","r")
	var loadvalue= variable_struct_get(oSaveManager.struct_main,levelminusoom) //0 =  not complete, >0.5 & <1.0 without bird, >1.0 complete

	if loadvalue!=0 {overlay_index=1} //open the door

	//check if previous previous level is complete
	var prevlevel=string_insert(level_index-2,"Room",5)
	var levelminusoom=string_replace(prevlevel,"Room","r")
	var loadvalue= variable_struct_get(oSaveManager.struct_main,levelminusoom) //0 =  not complete, >0.5 & <1.0 without bird, >1.0 complete
	/// debug 
	if oCamera.debug=true {loadvalue=1}
	///
	if loadvalue!=0 {overlay_index=1}//open the door

	//check if actual level is complete
	var thislevel=string_insert(level_index,"Room",5)
	var levelminusoom=string_replace(thislevel,"Room","r")
	var loadvalue= variable_struct_get(oSaveManager.struct_main,levelminusoom) //0 =  not complete, >0.5 & <1.0 without bird, >1.0 complete
	
	if loadvalue=1 {overlay_index=2}//show a star (chapter complete)
	if loadvalue>0.5 and loadvalue<1 {overlay_index=3}//show a star (chapter complete)

	if room_exists(level)=false {overlay_index=0}

	if overlay_index=1 or overlay_index=2 or overlay_index=3 and sprite_index=sPortal {opensprite=true}
	
	//get score (jumps)
	myloadvalue=loadvalue
	if myloadvalue!= undefined
	{
		var lvstring=string_format(myloadvalue,1,3)
		var lvlen=string_length(lvstring)
		 scor= real(string_copy(lvstring,lvlen-1,lvlen))
		 
		 //show_debug_message(variable_struct_get(oSaveManager.score_struct,level)
		 perfectscore=oSaveManager.score_struct[$ room_get_name(level)]
		 
		//calculate
		
		{rank=2}
		if scor<=(perfectscore+9 ){rank=2}
		if scor<=(perfectscore+6 ){rank=3}
		if scor<=(perfectscore+3 ){rank=4}
		if scor<=(perfectscore	 ){rank=5}
		if scor<1	{rank=0}	
	}

	//make the player appear in front of the door

	if oCamera.previous_room=thislevel and oCamera.previous_room!=noone and oCamera.previous_room!=room_get_name(RoomIntro3) //if last room is the portal room
	{
		oPlayer.x=x oPlayer.y=y //transport the player	
		oCamera.px=oPlayer.x oCamera.py=oPlayer.y
		
	}
wait=2
}//end wait

if drawy!=y {drawy=smooth_approach(drawy,y,0.1)}

if instance_exists(oPlayer)
{
	if point_distance(x,y,oPlayer.x,oPlayer.y-16)<22 and opensprite=true
	{
	
	drawinfo=true
	}
	else
	{
	drawinfo=false

	}
	
	
	if point_distance(x,y,oPlayer.x,oPlayer.y)>32+16
	{open=false}

	if point_distance(x,y,oPlayer.x,oPlayer.y)<6 and !instance_exists(oTransition) and opensprite=true
	{
		
		if open=false 
		{
		audio_play_sfx(snd_porta_knock,false,-19,8) 
		shake_gamepad(0.4,2)
		repeat(3) {instance_create_layer(x,y+3,"Instances_2",oStarSmol)}
		}
		open=true
		
		if open_index=open_number-1
		{
		//audio_sound_gain(bgm_hub   ,0,1000)
		//audio_sound_gain(bgm_hub_01,0,1000)
		//audio_sound_gain(bgm_hub_02,0,1000)
		//audio_sound_gain(bgm_hub_03,0,1000)
		//audio_sound_gain(bgm_hub_04,0,1000)
		var trans=instance_create_layer(0,0,layer,oTransition)
		trans.target_room=level oCamera.levelselx=x oCamera.levesely=y
		}
		
	}
}
if opensprite=true
{
	if open=true
	{
	if open_index=open_number-15 {audio_play_sfx(snd_porta_abre,false,-22.63,7)}
	open_index=approach(open_index,open_number-1,0.5)
	}
	else
	{
	if open_index=open_number-1 {audio_play_sfx(snd_porta_fecha,false,-24,5)}
	open_index=approach(open_index,0,0.5)

	}
}

if distance_to_object(oPlayer)<16
{
image_xscale=smooth_approach(image_xscale,1,0.25)
}
else if open=false
{
image_xscale=smooth_approach(image_xscale,0,0.25)
}

if instance_exists(oPauseMenu) {drawinfo=false}

if drawinfo=true {bright=approach(bright,3,0.25)}
if drawinfo=false and bright!=0 {bright=approach(bright,0,0.5)}
if instance_exists(oPauseMenu) {drawinfo=false}

draw=!draw