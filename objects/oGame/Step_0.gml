scr_inputget()

// TODO: Use the InputManager
// if key_start=true // and oPlayer.vsp=0 and oPlayer.hsp=0
if key_start == true
{
	// if !instance_exists(oPauseMenu)
	if !instance_exists(oPauseMenu) 
	{
		if global.game_state != GameState.SPLASH && 
			global.game_state != GameState.MENU &&
			global.game_state != GameState.CUTSCENE
		{
			instance_create_layer(0,0,layer,oPauseMenu)
		}
	}
}