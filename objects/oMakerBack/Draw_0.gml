
// Novo codigo

draw_sprite_tiled(
	sCheckerBack,
	oLevelMaker.style_selected + (instance_exists(oPlayer) ? (oPlayer.night * 5) : 0),
	0,
	0
)

// Codigo antigo

//if instance_exists(oPlayer)
//{
//	if oPlayer.night=true
//	{draw_sprite_tiled(sBackNight,oLevelMaker.style_selected,0,0)}
//	else
//	{draw_sprite_tiled(sBackDay,oLevelMaker.style_selected,0,0)}
//}
//else
//{
//	draw_sprite_tiled(sBackDay,oLevelMaker.style_selected,0,0)
//}















