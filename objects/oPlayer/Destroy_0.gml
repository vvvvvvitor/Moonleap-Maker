

var sfxdeath=choose(sfx_luano_death_pause_01,sfx_luano_death_pause_02,sfx_luano_death_pause_03,sfx_luano_death_pause_04,sfx_luano_death_pause_05)
audio_play_sfx(sfxdeath,false,-8.79,5)

	if instance_exists(oTimeAttack) {oTimeAttack.hearts-=1} 
	
if oCamera.current_skin=5
{
	if oCamera.night=false
	{
		PlayerDead=		sPlayerDead5
	}
	else
	{
		PlayerDead=		sPlayerDead6	
	}
}

oCamera.deathcount+=1

instance_create_layer(x,y,layer,oDead)
oDead.sprite_index=PlayerDead
oDead.image_xscale=image_xscale
oDead.night=night
oDead.trueblack=trueblack
oDead.neutral=neutral

if oCamera.current_skin=1 or oCamera.current_skin=6
{
	oDead.visible=false oDead.current_skin=1
	oDead.sprite_index=sPlayerDead1
	repeat(3) {instance_create_layer(x,y,"Instances_2",oBigSmoke)}
	audio_play_sfx(snd_kick,false,-7.3,13)
	
}

//if dsquash=true {oDead.sprite_index=sPlayerDead265}

with(oLevelMaker){
	end_level_and_return_to_editor();
}