/// @description Load save

if (file_exists("save.moon"))	
{
	//transform the json into arrays and structs
	var buffer_data = buffer_load( "save.moon");
	var string_data = buffer_read( buffer_data, buffer_string);
	buffer_delete (buffer_data);
		
	var load_data= json_parse( string_data);
	var load_entity= array_get(load_data,0);
		
		
	#region update game settings and update screen
		
	global.settings.filter =		struct_read(load_entity, "filter", global.settings.filter);
	global.settings.enable_sfx =	struct_read(load_entity, "enable_sfx", global.settings.enable_sfx);
	global.settings.bgm_volume =	struct_read(load_entity, "enable_bgm", global.settings.bgm_volume);
	global.settings.gamespd =		struct_read(load_entity, "gamespd", global.settings.gamespd);
	global.settings.deaths =		struct_read(load_entity, "deaths", global.settings.deaths);
	global.settings.vibration=		struct_read(load_entity,"vibration",global.settings.vibration);
	global.settings.window_scale=	struct_read(load_entity,"window_scale",global.settings.window_scale);
	global.settings.fullscreen=	struct_read(load_entity,"fullscreen",global.settings.fullscreen);
	global.settings.buttons=		struct_read(load_entity,"buttons",global.settings.buttons);

	
	show_debug_message("load data!");
	//apply the configs to the actual game, this needs to happen in case the player delete the save
	obDirection.image_alpha=	global.settings.buttons/100
	obJump.image_alpha=			global.settings.buttons/100
	oBpause.image_alpha=		global.settings.buttons/100			
	window_set_fullscreen(global.settings.fullscreen)
	window_set_size(320*global.settings.window_scale,180*global.settings.window_scale)
	bgm_set_volume(global.settings.bgm_volume);
	lang_set(struct_read(load_entity,"language",lang_get()));
	//
	

	#endregion	
		
	array_data= load_data;
	struct_main=  array_pop(array_data);
	load=false;
	show_debug_message("game load" +  string_data);
}


