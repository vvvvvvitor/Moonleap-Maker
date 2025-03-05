/// @description Insert description here
// You can write your code in this editor
if instance_exists(oPlayer)
{
	if place_meeting(x,y,oPlayer)
	{
		if instance_exists(oProgress) {if oProgress.porcentagem<120{exit}}
		
		if oPlayer.sprite_index=oPlayer.PlayerSit	and oPlayer.image_index>(oPlayer.image_number-0.9)
		{
			draw=true
		}
		else
		{
			draw=false
		}
	}
	
}








