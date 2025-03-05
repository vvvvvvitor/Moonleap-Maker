/// @description Insert description here
// You can write your code in this editor

//if(room=RoomCreditsAlves){target_room=room}
switch(state) {

	 case states.OUT:
		if sub_image_index < imax + xmax {
			//increment index
			sub_image_index +=sub_image_index_inc;
		} else {
		state = states.IN;
		
		//goto room
		if room_exists(target_room) room_goto(target_room);
	}
	break;
	case states.IN:
	if sub_image_index> 0 {	
		if wait=0 {sub_image_index -= sub_image_index_inc}
	} else instance_destroy();

	break;
}

if wait=0 {drawname-=1 drawskip-=1}

if drawname>0
{
	if drawname=5 {if wait=0 {wait=150} }
}


if drawskip>0
{
	if drawskip=5 {if wait=0 {wait=175} }
}

	wait=approach(wait,0,1)
//if room=rmAudioEditor0 {instance_destroy()}

if room=Room100
{
	
	if instance_exists(oPlayer)
	{
		if oPlayer.y<room_height/2 { nice_black=c_black} else {nice_black=make_color_rgb(0,0,72)}
	}
}
else
{
bgm_set_volume(global.settings.bgm_volume); //update volume (during transitions)
}

