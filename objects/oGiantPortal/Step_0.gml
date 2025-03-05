/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// @description Insert description here
// You can write your code in this editor

if wait=0
{
	drawy=94
	level=asset_get_index(string_insert(level_index,"Room",8))

	color=make_color_rgb(0,85,170)


	//check if is a first stage
	var thislevel=string_insert(level_index,"Room",5)
	if thislevel="Room0" or thislevel="Room10" or thislevel="Room20" or thislevel="Room30"
	{overlay_index=1}//open the door
	overlay_index=1

	//check if previous level is complete
	var prevlevel=string_insert(level_index-1,"Room",5)
	var levelminusoom=string_replace(prevlevel,"Room","r")
	var loadvalue= variable_struct_get(oSaveManager.struct_main,levelminusoom) //0 =  not complete, >0.5 & <1.0 without bird, >1.0 complete

	if real(loadvalue)!=0 {overlay_index=1} //open the door

	//check if previous previous level is complete
	var prevlevel=string_insert(level_index-2,"Room",5)
	var levelminusoom=string_replace(prevlevel,"Room","r")
	var loadvalue= variable_struct_get(oSaveManager.struct_main,levelminusoom) //0 =  not complete, >0.5 & <1.0 without bird, >1.0 complete
	/// debug 
	if oCamera.debug=true {loadvalue=1}
	///
	if real(loadvalue)!=0 {overlay_index=1}//open the door

	//check if actual level is complete
	var thislevel=string_insert(level_index,"Room",5)
	var levelminusoom=string_replace(thislevel,"Room","r")
	var loadvalue= variable_struct_get(oSaveManager.struct_main,levelminusoom) //0 =  not complete, >0.5 & <1.0 without bird, >1.0 complete
	myloadvalue= loadvalue

	if real(loadvalue)!=0 {overlay_index=2}
	//if loadvalue>0.5 and loadvalue<=1 {overlay_index=3}//show a star (chapter complete)
	

	//if loadvalue=1 {overlay_index=2}//show a star (chapter complete)
	//if loadvalue>0.5 and loadvalue<1 {overlay_index=3}//show a star (chapter complete)

	if room_exists(level)=false {overlay_index=0}

	if overlay_index=1 or overlay_index=2 or overlay_index=3 and sprite_index=sPortal {opensprite=true}
	
	//get score (jumps)
	
	if myloadvalue!= undefined
	{
		//this hell only happens to this portal
		
		
		var lvstring=string_format(oSaveManager.struct_main[$"r60"],1,3)
		var lvlen=string_length(lvstring)
		scor1= real(string_copy(lvstring,lvlen-1,lvlen))
		
		var lvstring=string_format(oSaveManager.struct_main[$"r61"],1,3)
		var lvlen=string_length(lvstring)
		scor2= real(string_copy(lvstring,lvlen-1,lvlen))
		
		var lvstring=string_format(oSaveManager.struct_main[$"r62"],1,3)
		var lvlen=string_length(lvstring)
		scor3= real(string_copy(lvstring,lvlen-1,lvlen))
		
		var lvstring=string_format(oSaveManager.struct_main[$"r63"],1,3)
		var lvlen=string_length(lvstring)
		scor4= real(string_copy(lvstring,lvlen-1,lvlen))
	
		 
		 //show_debug_message(variable_struct_get(oSaveManager.score_struct,level)
		 perfectscore1=real(oSaveManager.score_struct[$room_get_name(Room60)])
		 perfectscore2=real(oSaveManager.score_struct[$room_get_name(Room61)])
		 perfectscore3=real(oSaveManager.score_struct[$room_get_name(Room62)])
		 perfectscore4=real(oSaveManager.score_struct[$room_get_name(Room63)])
		 
		//calculate
		
		  {rank1=1}
		if scor1>0.5   and scor1<0.6	{rank1=1}
		if scor1<=(perfectscore1+9 )	{rank1=2}
		if scor1<=(perfectscore1+6 )	{rank1=3}
		if scor1<=(perfectscore1+3 )	{rank1=4}
		if scor1<=(perfectscore1   )	{rank1=5}
		if scor1=0				{rank1=0}
		//if string_length(lvstring)<4	{rank1=0} //before dlc
		
		  {rank2=1}
		if scor2>0.5   and scor2<0.6	{rank2=1}
		if scor2<=(perfectscore2+9 )	{rank2=2}
		if scor2<=(perfectscore2+6 )	{rank2=3}
		if scor2<=(perfectscore2+3 )	{rank2=4}
		if scor2<=(perfectscore2   )	{rank2=5}
		if scor2=0						{rank2=0}
		//if string_length(lvstring)<4	{rank2=0} //before dlc
		
		  {rank3=1}
		if scor3>0.5   and scor3<0.6	{rank3=1}
		if scor3<=(perfectscore3+9 )	{rank3=2}
		if scor3<=(perfectscore3+6 )	{rank3=3}
		if scor3<=(perfectscore3+3 )	{rank3=4}
		if scor3<=(perfectscore3   )	{rank3=5}
		if scor3=0						{rank3=0}
		//if string_length(lvstring)<4	{rank3=0} //before dlc
		
		  {rank4=1}
		if scor4>0.5   and scor4<0.6	{rank4=1}
		if scor4<=(perfectscore4+9 )	{rank4=2}
		if scor4<=(perfectscore4+6 )	{rank4=3}
		if scor4<=(perfectscore4+3 )	{rank4=4}
		if scor4<=(perfectscore4   )	{rank4=5}
		if scor4=0						{rank4=0}
		//if string_length(lvstring)<4	{rank4=0} //before dlc
	}

	//make the player appear in front of the door

	if (oCamera.previous_room=room_get_name(Room60) or oCamera.previous_room=room_get_name(Room61) or oCamera.previous_room=room_get_name(Room62) or oCamera.previous_room=room_get_name(Room63) ) and oCamera.previous_room!=noone and oCamera.previous_room!=room_get_name(RoomIntro3) //if last room is the portal room
	{
		oPlayer.x=x oPlayer.y=y //transport the player	
		oCamera.px=oPlayer.x oCamera.py=oPlayer.y
		//audio_play_sound(sndStgClear,0,0)
	}
wait=2
}//end wait












