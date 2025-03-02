/// @description Insert description here
// You can write your code in this editor
if !instance_exists(oPlayer) {exit;}

if change=true and instance_exists(oPlayer) and cooldown=0
{

	cooldown=10
	x=oPlayer.x
	y=oPlayer.y
	oPlayer.x=xprevious
	oPlayer.y=yprevious
	oPlayer.flash=true
	flash=true
	//vsp=-0.25
	//hsp=0
	//vsp=oPlayer.vsp
	//hsp=oPlayer.hsp
	//hsp_plus=oPlayer.hsp_plus
	
	//oPlayer.vsp+=oldvsp
	//oPlayer.hsp+=oldhsp
	
	
	instance_create_layer(x,y,layer,oGemSpark)
	

	
	var sfxcogu=choose(snd_warp,snd_warp2,snd_warp3) audio_play_sfx(sfxcogu,false,-14,2)
	change=false
	scr_change_orb()
	
	if oPlayer.night=true {night=false} else {night=true}

}


//scr_moving_plat()


/// @description freeze_game(spd/by)
/// @param spd/by

if instance_exists(oPauseMenu) or instance_exists(oDead) {image_speed=0 exit;}			if instance_exists(oTransition) { if oTransition.wait!=0 {image_speed=0 exit;} }; if instance_exists(oPlayer) { if oPlayer.state=oPlayer.WIN {image_speed=0 exit;} }


var hsp_new, vsp_new;

// Handle sub-pixel movement
cx += hsp
cy += vsp
hsp_new = floor(cx);
vsp_new = floor(cy);
cx -= hsp_new;
cy -= vsp_new;

if vsp!=0  //somente executa o código de movimento vertical se ele de fato tiver um
{
	repeat (abs(vsp_new)) {
    
		if (place_meeting(x, y + sign(vsp_new), oBounce)) {vsp=0 break;} //se colodir com o oBounce, para de ler o código daqui pra baixo
	
		if (!place_meeting(x, y + sign(vsp_new), oSolid)) { //se não colidir com obj terreno
				
			y += sign(vsp_new) //código relacionado ao próprio movimento
	    }
	    else { //caso ele colida com o terreno, ele para e para de ler o código
	        vsp = 0;
	        break;
	    }
	}
}

repeat(abs(hsp_new)) {
	
	if sign(hsp_new)=1  and place_meeting(x + 1, y, oPlatGhostL) and !place_meeting(x, y, oPlatGhostL) {hsp=0 break;}
	if sign(hsp_new)=-1 and place_meeting(x - 1, y, oPlatGhostR) and !place_meeting(x, y, oPlatGhostR) {hsp=0 break;}
	
	// UP slope
	if (place_meeting(x + sign(hsp), y, oSolid) && place_meeting(x + sign(hsp), y - 1, oSolid) && !place_meeting(x + sign(hsp), y - 1, oSolid)) {
	    y -= 1; 
	} else if (place_meeting(x + sign(hsp), y, oSolid) && !place_meeting(x + sign(hsp), y - 1, oSolid)) {
	    y -=1;  
	}
	
	// DOWN slope
	if vsp>=0
	{
		if (!place_meeting(x + sign(hsp), y, oSolid) && !place_meeting(x + sign(hsp), y + 1, oSolid) && !place_meeting(x + sign(hsp), y + 1, oSolid) && place_meeting(x + sign(hsp), y + 2, oSolid))
		  {  y += 1; }
			
		else if (!place_meeting(x + sign(hsp), y, oSolid) && !place_meeting(x + sign(hsp), y + 1, oSolid) && place_meeting(x + sign(hsp), y + 1, oSolid))
		    { y += 1;}
	}
	
	///Normal Terrain
	
	if (place_meeting(x + sign(hsp_new), y, oBounce)) {hsp=0 break;} //se colodir com o oBounce, para de ler o código daqui pra baixo
	
    if (!place_meeting(x + sign(hsp_new), y, oSolid))  //se não colidir com obj terreno
	{
		x += sign(hsp_new) 
	
	var ran=choose(1,2,3)
	if on_ground_var and ran=1
	{
	var dust=instance_create_layer(x,bbox_bottom+1,"Instances_2",oBigDust)
	dust.hsp=hsp/random_range(5,10)
	dust.vsp=vsp/random_range(5,10)
	}
		
    }
    else { //caso ele colida com o terreno, ele para e para de ler o código
		
		/////////////////////
		
        hsp = 0;
        break;
    }
}
