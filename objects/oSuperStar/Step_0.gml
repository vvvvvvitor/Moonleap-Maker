/// @description Insert description here
// You can write your code in this editor


if intro>0 {intro-=1}

if intro>1
{
	var dustx=x+random_range(-24,24)
	var dusty=y+random_range(-24,24)
	var dust=instance_create_layer(dustx,dusty,layer,oMagicDust)
	dust.xx=x
	dust.yy=y
}

if intro<80 and destroy=false
{
	image_xscale=smooth_approach(image_xscale,1,0.1)
	image_yscale=smooth_approach(image_yscale,1,0.1)
	speedmulti=smooth_approach(speedmulti,1,0.01)
	//image_speed=image_spd*speedmulti
}

if speedmulti<1.2
{
	y=smooth_approach(y,yy,0.01)
	y=smooth_approach(y,yy,0.01)
}


///////colisões

if place_meeting(x,y,oPlayer) and destroy=false
{
	//if speedmulti<2
	{
		oPlayer.flash=2
		var varname = "s" + string(starnumber);
		variable_struct_set(oSaveManager.struct_main,varname,1)
		oSaveManager.save=true
		
		switch(starnumber){
			case 1: if(!steam_get_achievement("MN_SECRET_1")){steam_set_achievement("MN_SECRET_1")}
			GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQDA");
			break;
			case 2: if(!steam_get_achievement("MN_SECRET_2")){steam_set_achievement("MN_SECRET_2")}
			GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQDQ");
			break;
			case 3: if(!steam_get_achievement("MN_SECRET_3")){steam_set_achievement("MN_SECRET_3")}
			GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQDg");
			break;
			case 4: if(!steam_get_achievement("MN_SECRET_4")){steam_set_achievement("MN_SECRET_4")}
			GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQDw");
			break;
			case 5: if(!steam_get_achievement("MN_SECRET_5")){steam_set_achievement("MN_SECRET_5")}
			GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQFA");
			break;
		}
	}
	destroy=true
	
	instance_create_layer(x,y,layer,oTextTemp)
	oTextTemp.text=LANG.text_holddown
	
}

if destroy=true { image_xscale=approach(image_xscale,0,0.25) image_yscale=image_xscale if image_xscale=0 {instance_destroy()}}

if alreadydone=true
{
blink=!blink
}

if distance_to_object(oPlayer)>200 {if audio_is_playing(snd_estrela_secreta_lp) {audio_sound_gain(snd_estrela_secreta_lp,0,2000)}}

if instance_exists(oProgress)
{
if starnumber=7
{
	with (oProgress)
	{
		c=approach(c,0,0.1)

		cor_progresso_atual=1
		cor_total_atual=1
		
		cor_progresso=cores[c+1]
		cor_total=cores[c]
		
	}
}
}