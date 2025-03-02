/// @description Insert description here
// You can write your code in this editor

if(room=RoomCreditsAlves){exit;}
if(room=RoomProgress){exit;}
if (room=RoomMenu or room=RoomMenu2 or room=RoomCredits or room=RoomCreditsAlves  or room=Room100) {exit;}

if prevroom!=room
{
drawname=9
}

if oCamera.deathcount=10 and (room=Room1 or room=Room2 or room=Room3 or room=Room4  or room=Room5)
{
drawskip=9	
}