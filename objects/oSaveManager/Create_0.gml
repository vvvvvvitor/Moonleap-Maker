

save=false 
first_claudio = false;
if (file_exists("save.moon")) {load=true; first_save=false;} 
else {load=false; first_save=true; first_claudio = true;}

if (load == true) {
	event_user(0);	
}
//first_save=true //debug only, this cleans the save

global.iniciou_sign_in = false;

carregou_save = false;
tenta_salvar = false;

uniqueName = "save_1";
description = "Slot 1";
existe_save_game = false;

valores_save_game = "";

//this is the PERFECT score
score_struct=
	{
		//normal levels 
	Room0:	04,
	Room1:	07,
	Room2:	08,
	Room3:	05,
	Room4:	01,
	Room5:	01,
	Room6:	04,
	Room7:	05,	
	Room8:	08,	
	Room9:	04,
	Room10: 02,
	Room11: 05,
	Room12: 06,
	Room13: 10,
	Room14: 06,
	Room15: 04,
	Room16: 03,
	Room17: 04,
	Room18: 12,
	Room19: 08,
	Room20: 02,
	Room21: 02,
	Room22: 06,
	Room23: 08,
	Room24: 04,
	Room25: 08,
	Room26: 11,
	Room27: 04,
	Room28: 07,
	Room29: 06,
	Room30: 05,
	Room31: 11,
	Room32: 11,
	Room33: 10,
	Room34: 06,
	Room35: 06,
	Room36: 02,
	Room37: 04,
	Room38: 04,
	Room39: 01,
	
		//DLC
	Room40:	04,	
	Room41:	07,	
	Room42:	05,	
	Room43:	10,	
	Room44:	08,	
	Room45:	13,	
	Room46:	02,	
	Room47:	09,	
	Room48:	11,	
	Room49:	05,	
	   //secret levels
	Room50:	06,	
	Room51:	04,
	Room52:	07,
	Room53:	05,	
	Room54:	14,	
	Room55:	13,	
	Room56:	06,	
	Room57:	08,	
	Room58:	04,	
	Room59:	06,	
		//final levels
	Room60:	02,	
	Room61:	10,	
	Room62:	14,	
	Room63:	02,
	}
	
	//*
if(os_type == os_android){
	alarm[9]=1;
	alarm[8]=10;
	exit;
}
//*/

string_envio_google = "";


if (first_save==true)
{

	var lang = os_get_language();
	switch (lang)
	{
	    case "en": lang_set("EN")		break;
	    case "pt": lang_set("PT-BR")	break;
	    case "es": lang_set("ES")		break;
		case "ja": lang_set("JA")		break;
		case "jv": lang_set("JA")		break;
		case "it": lang_set("IT")		break;
		case "zh": lang_set("ZH")		break;
	}
	
	var region=os_get_region();
	switch (region)
	{
	    case "BR":  lang_set("PT-BR")	break;
	    case "BRA": lang_set("PT-BR")	break;
	}
	
	save=false
	array_data= array_create() //create array that will contain all structs

	struct_main =//create main struct and get some values
	{

		filter	: global.settings.filter,
		enable_sfx	: global.settings.enable_sfx,
		enable_bgm	: global.settings.bgm_volume,
		gamespd	: global.settings.gamespd,
		deaths	: 0, //trust me
		language	: lang_get(),
		vibration : global.settings.vibration,
		fullscreen : global.settings.fullscreen,
		window_scale : global.settings.window_scale,
		buttons: global.settings.buttons,
	}
	
	for (var i = 0; i < 80; i++) //put room values on the main struct
	{
	    var key = "r" + string(i);
	    struct_main[$ key] = 0;
	}

	for (var i = 0; i < 30; i++) //put secret values on the main struct
	{
	    var key = "s" + string(i);
	    struct_main[$ key] = 0;
	}

	array_push(array_data,struct_main) //put data from structs in a array
	
	//turn all this data into json and save it via a buffer
	var string_data = json_stringify(array_data);
	var buffer_data = buffer_create(string_byte_length(string_data) +1, buffer_fixed, 1);
	buffer_write( buffer_data, buffer_string, string_data)
	buffer_save( buffer_data, "save.moon");
	buffer_delete(buffer_data)
	
	if (os_type == os_switch) { switch_save_data_commit(); }
	show_debug_message("game saved create" +  string_data)
}
