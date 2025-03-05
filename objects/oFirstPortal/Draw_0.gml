if drawy!=y {drawy=smooth_approach(drawy,y,0.1)}


	if instance_exists(oPlayer)
	{
		var _plr_dist = point_distance(x,y,oPlayer.x,oPlayer.y);
	
		if (_plr_dist < 100) {
	
			if point_distance(x,y,oPlayer.x,oPlayer.y-16)<22 and opensprite=true
			{
				drawinfo=true
			}
			else
			{
				drawinfo=false
			}
	
	
			if _plr_dist>32+16
			{open=false}

			if _plr_dist<7 and !instance_exists(oTransition) and opensprite=true
			{
		
				if open=false 
				{
				audio_play_sfx(snd_porta_knock,false,-19,8) 
				shake_gamepad(0.4,2)
				repeat(3) {instance_create_layer(x,y+3,"Instances_2",oStarSmol)}
				}
				open=true
		
				if open_index=open_number-1
				{

				audio_sound_gain(bgm_hub   ,0,500)
				audio_sound_gain(bgm_hub_01,0,500)
				audio_sound_gain(bgm_hub_02,0,500)
				audio_sound_gain(bgm_hub_03,0,500)
				audio_sound_gain(bgm_hub_04,0,500)
			
				oPlayer.gowhite=true
				var trans=instance_create_layer(0,0,layer,oTransition)
				trans.target_room=level oCamera.levelselx=x oCamera.levesely=y trans.solid=true
				}
		
			}
		}
	}
	
	if level_index=0 and myloadvalue=0
	{opensprite=true open=true}


if opensprite=true
{
	if open=true
	{
	if open_index=open_number-15 {audio_play_sfx(snd_porta_abre,false,-22.63,7)}
	open_index=approach(open_index,open_number-1,0.5)
	}
	else
	{
	if open_index=open_number-1 {audio_play_sfx(snd_porta_fecha,false,-24,5)}
	open_index=approach(open_index,0,0.5)

	}
}

if drawinfo=true {bright=approach(bright,3,0.25)}
if drawinfo=false and bright!=0 {bright=approach(bright,0,0.5)}

draw_self_perfect()
draw_sprite(sPortalOverlay,overlay_index,x,y)

if level_index<100
{
draw_sprite(sPortalNumber,level_index,x,y)
}
else
{
draw_sprite(sPortalNumber,10,x,y)
}

if opensprite=true
{draw_sprite(sPortalopen,open_index,x,y)}