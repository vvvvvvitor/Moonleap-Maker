/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor






if wait=0 //read data
{
	image_speed=0
	number=0
	if portal=1
	{
	for (var i = 0; i < 9; i += 1)

	{
	var key = "r" + string(i);
	if(oSaveManager.struct_main[$ key] != "0.0") {number+=1}
	}
	}

	if portal=2
	{
	for (var i = 9; i < 19; i += 1)

	{
	var key = "r" + string(i);
	if(oSaveManager.struct_main[$ key] != "0.0") {number+=1}
	}
	}

	if portal=3
	{
	for (var i = 19; i < 29; i += 1)

	{
	var key = "r" + string(i);
	if(oSaveManager.struct_main[$ key] != "0.0") {number+=1}
	}
	}

	if portal=4
	{
	for (var i = 29; i < 39; i += 1)

	{
	var key = "r" + string(i);
	if(oSaveManager.struct_main[$ key] != "0.0") {number+=1}
	}
	}
	
	if portal=5
	{
	for (var i = 0; i < 60; i += 1)

	{
		var key = "r" + string(i);
		if(oSaveManager.struct_main[$ key] != "0.0") {number+=1}
	}	
	}
	
	if portal=6
	{
	for (var i = 60; i < 64; i += 1)

	{
	var key = "r" + string(i);
	if(oSaveManager.struct_main[$ key] != "0.0") {number+=1}
	}	
	}
}
wait=0

var lastframe=image_number-2

if !instance_exists(oPlayer)  {exit;}
var pdistance=point_distance(xstart,ystart+(sprite_height),oPlayer.x,oPlayer.y+8)

if pdistance<128
{
	if collision_rectangle(x-32,y-15,x+64,y+80,oPlayer,false,true) //opens the door
	{open=true}
	else if number<lastframe
	{
		open=false
		image_index=approach(image_index,0,0.25)//decrease the frame
		audio_stop_sound(doorsfx)
	}
}

if open=true 
{
	image_index=approach(image_index,number,0.25)//increase the frame

	if image_index!=number and x=xstart // play sounds
	{if !audio_is_playing(doorsfx) {audio_play_sfx(doorsfx,false,-13,0)}}
	
	if image_index=number and number<lastframe
	{audio_stop_sound(doorsfx)} //stop the sound if the door cant open

	if image_index>=lastframe //start rising
	{
		image_index=lastframe
		switch(portal){
			case 0: if(!steam_get_achievement("MN_WORLD_0")){steam_set_achievement("MN_WORLD_0");}
			GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQFQ");
			break;
			break;
			case 1: if(!steam_get_achievement("MN_WORLD_1")){steam_set_achievement("MN_WORLD_1");}
			GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQAw");
			break;
			case 2: if(!steam_get_achievement("MN_WORLD_2")){steam_set_achievement("MN_WORLD_2");}
			GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQBA");
			break;
			case 3: if(!steam_get_achievement("MN_WORLD_3")){steam_set_achievement("MN_WORLD_3");}
			GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQBQ");
			break;
			case 4: if(!steam_get_achievement("MN_WORLD_4")){steam_set_achievement("MN_WORLD_4");}
			GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQBg");
			break;
		}
		x=approach(x,xstart-(sprite_width),0.25)
		
		if x!=xstart-32
		{
			oCamera.shake=1
			shake_gamepad(0.25,1)
		}
	}

}













