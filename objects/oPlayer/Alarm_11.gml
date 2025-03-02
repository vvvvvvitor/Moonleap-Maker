/// @description Insert description here
// You can write your code in this editor
if !instance_exists(oMenu) and !instance_exists(oPauseMenu)
{
	if room!=RoomMenu and room!=RoomMenu2 and room!=RoomFinal and room!=RoomCredits and room!=RoomCreditsAlves and room!=RoomProgress
	if(!steam_get_achievement("MN_STOPPED")){steam_set_achievement("MN_STOPPED")}
	GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQEg");
}