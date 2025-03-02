/// @description Insert description here
// You can write your code in this editor
time=2
shake=2
oCamera.shake=3
shake_gamepad(1,20)



global.settings.deaths+=1;

show_debug_message(string(steam_get_achievement("MN_DEATH_10")));
show_debug_message(string(global.settings.deaths));
//global.settings.deaths

if(global.settings.deaths>=10){
	if(!steam_get_achievement("MN_DEATH_10")){
		show_debug_message("foi");
		steam_set_achievement("MN_DEATH_10")
		oSaveManager.save=true;
	}
	GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQAQ");
}

if(global.settings.deaths>=100){
	if(!steam_get_achievement("MN_DEATH_100")){
		steam_set_achievement("MN_DEATH_100");
			oSaveManager.save=true;
	}
	GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQAg");
}



if instance_exists(oNeutralFlag) 
{neutral=true}