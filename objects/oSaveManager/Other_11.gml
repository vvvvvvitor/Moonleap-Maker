/// @description 
// You can write your code in this editor


if (load == true) {
	event_user(0);	
}
//first_save=true //debug only, this cleans the save

global.iniciou_sign_in = false;

carregou_save = false;
tenta_salvar = false;

uniqueName = "";
description = "";
existe_save_game = false;

valores_save_game = "";

if (first_save==true)
{
	oCamera.xspawn=noone
	oCamera.yspawn=noone
	oCamera.xcamspawn=noone
	oCamera.ycamspawn=noone
	global.settings = {
	filter: false,
	enable_sfx: true,
	bgm_volume: true,
	gamespd: 100,
	deaths: 0,
	vibration: 0.5,
	window_scale: 3,
	fullscreen: false,
	buttons: 50
};
	
	save=false
	array_data= array_create() //create array that will contain all structs

	struct_main =//create main struct and get some values
	{
		filter	: global.settings.filter,
		enable_sfx	: global.settings.enable_sfx,
		enable_bgm	: global.settings.bgm_volume,
		gamespd	: global.settings.gamespd,
		deaths	: global.settings.deaths,
		language	: lang_get(),
		vibration : global.settings.vibration,
		fullscreen : global.settings.fullscreen,
		window_scale : global.settings.window_scale,
		buttons: global.settings.buttons,
	}
	
	
	//apply the configs to the actual game, this needs to happen in case the player delete the save
	obDirection.image_alpha=	global.settings.buttons/100
	obJump.image_alpha=			global.settings.buttons/100
	oBpause.image_alpha=		global.settings.buttons/100			
	window_set_fullscreen(global.settings.fullscreen)
	window_set_size(320*global.settings.window_scale,180*global.settings.window_scale)
	bgm_set_volume(global.settings.bgm_volume);
	//
				
	
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
	
	show_debug_message("first save");
	if (os_type == os_switch) { switch_save_data_commit(); }
	show_debug_message("game saved user event 1" +  string_data)
	
}