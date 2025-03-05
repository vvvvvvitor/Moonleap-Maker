/// @description Insert description here
// You can write your code in this editor

//exit;
switch(async_load[?"type"])
{
	case "GooglePlayServices_SignIn":
		// At this point we are now signed in to the google play account.
		//show_message_async("GooglePlayServices_SignIn");
		//setSignedInMode(true);
		//GooglePlayServices_SavedGames_Load(true);
		if(!global.iniciou_sign_in){
			show_debug_message("entrou no sign in")
			
			//scr_delete();
			//alarm[9]=5;
			global.iniciou_sign_in = true;
		}
		break;
	
	// @triggered by GooglePlayServices_RevokeAccess()
	case "GooglePlayServices_RevokeAccess":
	// @triggered by GooglePlayServices_SignOut()
	case "GooglePlayServices_SignOut":
		//show_message_async("GooglePlayServices_SignOut");
		// At this point we are now signed out of the google play account.
		//setSignedInMode(false);
		break;
	
	// @triggered by the button (+) button on the ShowSavedGamesUI
	case "GooglePlayServices_SavedGames_ShowSavedGamesUI_OnNew":
		//show_message_async("GooglePlayServices_SavedGames_ShowSavedGamesUI_OnNew");
		// At this point we want to create a new slot so we request the user for a new
		// description name and handle slot creation under the Async Dialog event.
		dialog_ind = "Slot #0";
		break;
	
	// @triggered by the button (Select) button on the ShowSavedGamesUI
	case "GooglePlayServices_SavedGames_ShowSavedGamesUI_OnOpen":
		//show_message_async("GooglePlayServices_SavedGames_ShowSavedGamesUI_OnOpen");
		// At point we just requested a slot to be opened.
		// The selected slot (snapshot) metadata is returned inside the 'snapshotMetadata' key
		// amough other properties we have access to the 'uniqueName' identifier that we need
		// to call the function 'GooglePlayServices_SavedGames_Open' to query the saved data.
		var snapshotMeta = json_parse(async_load[? "snapshotMetadata"]);
		//var unique_Name = snapshotMeta.uniqueName;
		
		// This function uses the unique identifier name of the slot to query its data.
		// Note that this will trigger an Async Social event - "GooglePlayServices_SavedGames_Open"
		//GooglePlayServices_SavedGames_Open(uniqueName);
		break;
	
	// @triggered by closing the ShowSavedGamesUI
	case "GooglePlayServices_SavedGames_ShowSavedGamesUI_OnExit":
		//show_message_async("GooglePlayServices_SavedGames_ShowSavedGamesUI_OnExit");
		// At this point we just closed the ShowSavedGames google play UI.
		// We use this event to reload all the saves slots to properly display them
		// since we could have deleted a slot through the 'ShowSavedGamesUI'.
		//GooglePlayServices_SavedGames_Load(true);
		break;
	
	// @triggered by GooglePlayServices_SavedGames_CommitNew()
	case "GooglePlayServices_SavedGames_CommitNew":
		show_debug_message("GooglePlayServices_SavedGames_CommitNew");
		// Early exit if the callback "success" flag is not true.
		if (!async_load[? "success"]) exit;

		// Upon creating a new game save slot we refresh the current UI
		// by destroying all previous slots and reloading the data.
		alarm[9]=5;
		break;
	// @triggered by GooglePlayServices_SavedGames_Open()
	case "GooglePlayServices_SavedGames_Open":
		
		//return;
		// Early exit if the callback "success" flag is not true.
		if (!async_load[? "success"])
		{
			GooglePlayServices_SavedGames_Load(true);
			return;
		}
		
		//if !jogo_iniciado { show_debug_message("jogo iniciado return") jogo_iniciado = true return;}
		
		//show_message_async("GooglePlayServices_SavedGames_Open");
		
		// Ad this point we successfully queried the save data slot so we get access
		// to its 'metadata' and 'data' to 
		var snapshotMeta = json_parse(async_load[? "snapshotMetadata"]);		
		try{
			uniqueName = snapshotMeta.uniqueName;
			description = snapshotMeta.description;
		}catch(e){
			uniqueName = "save_1";
			description = "Slot 1";
		}
		
		// We can now parse the data from the callback, the saved data will be in the async_load
		// dictionary on a key named "data".
		var data = "";
		
		try{
			data = json_parse(async_load[? "data"]);
		}catch(e){
			exit;
		}
		
		//PEGA OS VALORES ANTES DE SALVAR
		var buffer_data_local = buffer_load( "save.moon");
		
		//array_set(array_data, 0, data);
		
		if(first_claudio){
			var string_data = json_stringify(data);
			show_debug_message(string_data);
		
			//ANTES DESSA ETAPA TESTAR OS DADOS LOCAIS E DO CLÁUDIO
			var buffer_data = buffer_create(string_byte_length(string_data) +1, buffer_fixed, 1);
			buffer_write( buffer_data, buffer_string, string_data);
			buffer_save( buffer_data, "save.moon");
			buffer_delete(buffer_data);
		
			existe_save_game = true;
		
			alarm[11]=5;
		
			show_debug_message("tamanho save = "+string(string_length(json_stringify(array_data))))
		}else{
			
		}
		
		buffer_delete (buffer_data_local);
		
		//show_debug_message("tamanho options = "+string(data[$ "Options1"]))
		break;
	case "GooglePlayServices_SavedGames_Delete":
		//show_message_async("GooglePlayServices_SavedGames_Delete");
	// @triggered by GooglePlayServices_SavedGames_CommitAndClose()
	case "GooglePlayServices_SavedGames_CommitAndClose":
		//show_message_async("GooglePlayServices_SavedGames_CommitAndClose");
		// Early exit if the callback "success" flag is not true.
		if(!async_load[? "success"]) exit;

		// At this point we successfully commited data or deleted a slot.
		// We will proceed to refresh the UI but since Google Play Services can have some delay
		// we should place the reload call in an alarm to ensure the action has completly finished.
		//
		// NOTE: This shouldn't be necessary but it's a bug from Google side
		alarm[9] = 5;
		break;
	// @triggered by GooglePlayServices_SavedGames_Load()
	case "GooglePlayServices_SavedGames_Load":
		// Early exit if the callback "success" flag is not true.
		show_debug_message("abriu o load")
		if(!async_load[?"success"]){
			GooglePlayServices_SavedGames_Load(true);
			exit;
		}
		
		if(async_load[?"snapshots"] == "[]"){
			//show_message_async("cheguei aqui mano");
			
			//googl
			//scr_salva_dados();
			//GooglePlayServices_SavedGames_Load(true);
		}else{
			first_save = false;
			GooglePlayServices_SavedGames_Open("save_1");
		}
		break;
}