/// @description Insert description here
// You can write your code in this editor

if wait=0
{
	drawy=94
	level=asset_get_index(string_insert(level_index,"Room",8))

	color=make_color_rgb(0,85,170)


	//check if is a first stage
	var thislevel=string_insert(level_index,"Room",5)
	if thislevel="Room0" or thislevel="Room10" or thislevel="Room20" or thislevel="Room30"  or thislevel="Room40"
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
	myloadvalue= loadvalue
	
	if loadvalue=1 {overlay_index=2}//show a star (chapter complete)
	if loadvalue>0.5 and loadvalue<1 {overlay_index=3}//show a star (chapter complete)

	if room_exists(level)=false {overlay_index=0}

	if overlay_index=1 or overlay_index=2 or overlay_index=3 and sprite_index=sPortal {opensprite=true}
	
	//get score (jumps)
	
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
