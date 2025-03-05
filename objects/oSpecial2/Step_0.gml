/// @description Insert description here
// You can write your code in this editor


scr_inputget();

if(star == 16){exit;}

if(change){
	if(!global.settings.bgm_volume and !global.settings.enable_sfx){
		done = true;
	}
}

if done=true and !instance_exists(oPauseMenu) {with(instance_create_layer(oCamera.x+(320/2),oCamera.y+(180/2)-16,"Instances_2",oSuperStar)){starnumber=2} star=16}



