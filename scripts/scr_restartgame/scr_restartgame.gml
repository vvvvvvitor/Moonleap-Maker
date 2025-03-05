// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_restartgame(){

audio_stop_all()

		if !instance_exists(oTransition) 
			{var trans=instance_create_layer(0,0,layer,oTransition) trans.target_room=RoomMenu}
		
			if oCamera.arcade=true
			{	
			//	if (file_exists("save.moon"))	
			//	file_delete("save.moon")
			}

with(oCamera)
{
drawname=0
bird0=false
bird1=false
bird2=false
bird3=false
}

with(oSaveManager) {event_perform(ev_create,0)}


}