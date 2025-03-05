// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_salva_dados(){
	// We create a temporary path for the thumbnail to be saved to.
	
	//var temp_array = array_push(oSaveManager.array_data,oSaveManager.struct_main)
	var temp_string = string_envio_google;
	if(temp_string == ""){
		oSaveManager.alarm[9] = 40;
		exit;
	}
	var path = "save_thumbnail.png"

	// We have this thumbnail to the given path
	var sprite = sIcon;
	var subimage = 0;
	sprite_save_w(sprite, subimage, path);

	//We get the currently opened slot uniqueName and description
	var description = "Slot 1";
	
	show_debug_message("tentei aqui " + description + " " + temp_string);

	// Finally we can commit the changes and close the slot using the function
	// below the requires the 'name' (unique id) the 'description' tag, the 'jsonData'
	// in string format (it can be any data as long as it is a string) and the path to the
	// thumbnail being used for the save.
	// This function call will trigger an Social Async event callback of the same name
	// "GooglePlayServices_SavedGames_CommitAndClose"
	
	//GooglePlayServices_SavedGames_Delete(obj_control.uniqueName);
}