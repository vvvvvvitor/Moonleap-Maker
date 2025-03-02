/// @description Insert description here
// You can write your code in this editor
if night=false{sprite_index=sStarDaySpike} else {sprite_index=sStarDay} 

on_ground_var= place_meeting(x, y + 1, oSolid) or place_meeting(x, y + 1, oPermaSpike) or (place_meeting(x, y + 1, oPlatGhost) and !place_meeting(x, y, oPlatGhost))
if on_ground_var=false and image_yscale=1 and image_angle=0 {vsp+=0.125}
if vsp>4 {vsp=4}

if y>room_height{y-=180}
if x>room_width{x-=320}
if y<0{y+=180}
if x<0{x+=320}
