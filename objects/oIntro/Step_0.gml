/// @description Insert description here
// You can write your code in this editor

scr_inputget() //is what gives meaning to key_left key_right...

//checks the save data and skip intro only if the level 1 is completed

var loadvalue= 0
try{
	loadvalue= variable_struct_get(oSaveManager.struct_main,"r0") //0 =  not complete, >0.5 & <1.0 without bird, >1.0 complete
}catch(e){
	
}
loadvalue=1 ///////////////////debug
//skip intro

skiptime-=1
if skiptime=0 {sure=-1}

	if key_jump_pressed=true or key_start=true {go=true}


if loadvalue!=0 and time < 20
{
	if key_jump_pressed=true or key_start=true {sure+=1 skiptime=180}
	if sure=1
	{
		if !instance_exists(oTransition)
		{
		audio_play_sfx(sndStarGame,false,-6.2,0)
		var trans=instance_create_layer(0,0,layer,oTransition)
		trans.target_room=RoomMenu;
		instance_destroy()
		}
	}
}

with (oPlayer) {
	y=90;
}

if go=true or time<-1.25
{
time+=0.0166666666666667
}
// Checks if 4 seconds have passed and swaps the sprite

if (time >= -6)
{
	sindex=sguselect
	text=""
	if time>=-2 {image_speed=-1} else {image_speed=1}
}

if (time >= -1)
{
	sindex=sEmpty
	if time>=3 {image_speed=-1} else {image_speed=1}
	text=LANG.text_poem1
}


if (time >= 4)
{
	if room=RoomIntro0 {room_goto_next()}
	
	sindex=sIntro1trans
	text=LANG.text_poem2
	if time>=8 {image_speed=-1} else {image_speed=1}
}

if (time >= 9) 
{
	if room=RoomIntro1 {room_goto_next()}
	
	sindex=sIntro2trans
	text=LANG.text_poem3
	image_speed=1
}


if (time >= 20)
{
	if room=RoomIntro2 {room_goto_next()}
	
	sindex=sEmpty
	text=LANG.text_poem4
	image_speed=1

	if time=25
	{
		TweenEasyMove(x,y,x,ystart+180,0,250,EaseInOutSine) //just to move the text
		with(ointromenu) {TweenEasyMove(x,y,x,(parallax*180),0,250,EaseInOutSine)}
		with(oSparkIntro) {TweenEasyMove(x,y,x,180+(parallax*(180)),0,250,EaseInOutSine)}
	}
}

if time=30 {instance_destroy()}
/////////////////////////////////////////////////////////////////////////

sprite_index=sindex

if image_speed=1 and image_index>image_number-1 {image_index=image_number-0.9}
if image_speed=-1 and image_index<1 {image_index=0.9}


if sprite_index=sIntro1trans or sprite_index=sIntro2trans or sprite_index=sEmpty or sprite_index=sguselect
{
	if floor(image_index)=1 {text_color=c_preto1 }
	if floor(image_index)=2 {text_color=c_preto2 }
	if floor(image_index)=3 {text_color=c_preto3 }
	if floor(image_index)=4 {text_color=c_branco1}
	if floor(image_index)=5 {text_color=c_branco2}
	if floor(image_index)=5 {text_color=c_branco2}
}

if y>ystart+175 {instance_destroy()}





if debug_mode=true {room_goto(Room100) instance_destroy()}

if maker_mode=true {room_goto(RoomMaker0) instance_destroy()}