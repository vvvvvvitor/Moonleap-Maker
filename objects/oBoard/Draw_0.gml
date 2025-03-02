/// @description Insert description here
// You can write your code in this editor
	if !instance_exists(oPlayer) {exit;}

		var _plr_dist = point_distance(x+8,y+8,oPlayer.x,oPlayer.y);
	
		if (_plr_dist < 100) {
	
			if point_distance(x,y,oPlayer.x,oPlayer.y-8)<13 
			{
				drawinfo=true
			}
			else
			{
				drawinfo=false
			}
		}
	
if drawinfo=true {bright=approach(bright,3,0.25)}
if drawinfo=false and bright!=0 {bright=approach(bright,0,0.5)}

draw_self_perfect()
