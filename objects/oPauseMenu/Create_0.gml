scr_inputcreate()

if (room=RoomMenu or room=RoomMenu2 or room=RoomCredits or room=RoomCreditsAlves  or room=Room100 or room=rm_blank0)
{
	roomname=" "
	_yy = 64;//104-ceil(_menu_ops/2)*_menu_y_gap;
}
else
{
	var name=LANG[$ room_get_name(room)]
	if is_string(name)=false {name=" "}
	//if !(room=Room60 or room=Room61 or room=Room62 or room=Room63)
	//{roomname=string_delete(name,1,4)}//remove the level number
	//else
	{roomname=name}
		
	_yy = 73;//104-ceil(_menu_ops/2)*_menu_y_gap;
}


wavevar=0

if global.settings.enable_sfx=true
{
	audio_play_sound(sndUiChange,10,false,power(10, -18.2/20),0,1.4)
}

nice_black=make_color_rgb(0,0,72);

if instance_exists(oPlayer) {
if (room==Room100){
		if oPlayer.y<room_height/2 { nice_black=c_black; }
	}
	else {
		if (instance_exists(oFlowerDay) or instance_exists(oSpaceDay) or instance_exists(oDunDay)) { nice_black=c_black; }
	}
}

//SETUP MENUS



//SETUP MENUS
if os_type= os_windows or os_type= os_linux or os_type= os_macosx  { //desktop
	menus = {
	main: [
		{
			name: "resume",
			text: function() { return LANG.text_resume; },
			action: function() {
				instance_destroy();
			}
		},
		{
			name: "options",
			text: function() { return LANG.text_options; },
			action: function() {
				menu = menus.options;
				option_index = 0;
			}
		},
		{
			name: "giveup",
			text: function() { return LANG.text_giveup; },
			action: function() {
				if !instance_exists(oTransition)
				{
					audio_play_sfx(sndStarGame,false,-6.2,0)
					var trans=instance_create_layer(0,0,layer,oTransition)
					trans.target_room=RoomMenu;
					instance_destroy()
				}
			}
		},
	],
		options: [
			{
				name: "vibrate",
				text: function() { return LANG.text_vibrate+string(round(global.settings.vibration*100))+"%"; ; },
				action: function() {
					global.settings.vibration+= 0.1;
					if (global.settings.vibration > 1) { global.settings.vibration = 0;}
					shake_gamepad(0.75,10)
				
				}
			},
			{
				name: "soundvideo",
				text: function() { return LANG.text_soundvideo; },
				action: function() {
					menu = menus.soundvideo;
					option_index = 0;
				}
			},
			{
				name: "assist",
				text: function() { return LANG.text_assist; },
				action: function() {
					menu = menus.assist;
					option_index = 0;
				}
			},
			// TODO: Se refira a oMenu.
			//{
			//	name: "language",
			//	text: function() { 
			//		return LANG.text_language+lang_get();
			//	},
			//	action: function() {
			//		var _langs = ["EN","PT-BR","JA","ES","IT","ZH"]; //set language order
			//		var _lang_index = array_find_index(_langs,lang_get()); //find position of current
			//		_lang_index++; //go to next
			//		if (_lang_index >= array_length(_langs)) { _lang_index = 0; } //wrap around
				
			//		lang_set(_langs[_lang_index]); //update current language				
					
			//		if (room=RoomMenu or room=RoomMenu2 or room=RoomCredits or room=RoomCreditsAlves  or room=Room100)
			//		{
			//			roomname=" "
			//			_yy = 64;//104-ceil(_menu_ops/2)*_menu_y_gap;
			//		}
			//		else
			//		{
			//			var name=LANG[$ room_get_name(room)]
			//			roomname=name
			//			//roomname=string_delete(name,1,4) //remove the level number
			//			_yy = 73;//104-ceil(_menu_ops/2)*_menu_y_gap;
			//		}
					
			//	}
			//},
			{
				name: "back",
				text: function() { return LANG.text_back; },
				action: function() {
					menu = menus.main;
					option_index = 0;
					oSaveManager.save = true;
				}
			},
		],
		assist: [
			{
				name: "colorblind",
				text: function() { return LANG.text_colorblind+(global.settings.filter ? LANG.text_ON : LANG.text_OFF); },
				action: function() {
					global.settings.filter = !global.settings.filter;
				}
			},
			{
				name: "gamespeed",
				text: function() { return LANG.text_speed+string(global.settings.gamespd)+"%"; },
				action: function() {
					global.settings.gamespd -= 10;
					if (global.settings.gamespd <= 40) { global.settings.gamespd = 100;}
					game_set_speed((global.settings.gamespd/100)*60,gamespeed_fps)
				}
			},
			{
				name: "back",
				text: function() { return LANG.text_back; },
				action: function() {
					menu = menus.options;
					option_index = 0;
				}
			},
		],
		soundvideo: [
			{		
				name: "music",
				text: function() { return LANG.text_music+(global.settings.bgm_volume ? LANG.text_ON : LANG.text_OFF); },
				action: function() {
					bgm_set_volume(!global.settings.bgm_volume) ; if oCamera.hubaudiocol!=noone { with(oCamera.hubaudiocol) {hub=true scr_hubchange()} }
				}
			},
			{
				name: "sfx",
				text: function() { return LANG.text_sfx+(global.settings.enable_sfx ? LANG.text_ON : LANG.text_OFF); },
				action: function() {
					global.settings.enable_sfx = !global.settings.enable_sfx;
				}
			},
			{
				name: "fullscreen",
				text: function() { return LANG.text_fullscreen+(window_get_fullscreen() ? LANG.text_ON : LANG.text_OFF); },
				action: function() {
					global.settings.fullscreen = !global.settings.fullscreen;
					window_set_fullscreen(global.settings.fullscreen) ;
					window_set_size(320*global.settings.window_scale,180*global.settings.window_scale)
				}
			},
			{
				name: "windowscale",
				text: function() { return LANG.text_windowscale+"x"+string(global.settings.window_scale); },
				action: function() {
					global.settings.window_scale  += 1;
					if (global.settings.window_scale  > 5) { global.settings.window_scale = 1;}
					window_set_size(320*global.settings.window_scale,180*global.settings.window_scale)
				}
			},
			{
				name: "back",
				text: function() { return LANG.text_back; },
				action: function() {
					menu = menus.options;
					option_index = 0;
				}
			},
		],
	}
}

if os_type= os_ios or os_type= os_android {  //switch, adnroid, IOS... remove stuff like windows scale, fullscreen and exit game
	menus = {
	main: [
		{
			name: "resume",
			text: function() { return LANG.text_resume; },
			action: function() {
				instance_destroy();
			}
		},
		{
			name: "options",
			text: function() { return LANG.text_options; },
			action: function() {
				menu = menus.options;
				option_index = 0;
			}
		},
	],
		options: [
			{		
				name: "music",
				text: function() { return LANG.text_music+(global.settings.bgm_volume ? LANG.text_ON : LANG.text_OFF); },
				action: function() {
					bgm_set_volume(!global.settings.bgm_volume) ; if oCamera.hubaudiocol!=noone { with(oCamera.hubaudiocol) {hub=true scr_hubchange()} }
				}
			},
			{
				name: "sfx",
				text: function() { return LANG.text_sfx+(global.settings.enable_sfx ? LANG.text_ON : LANG.text_OFF); },
				action: function() {
					global.settings.enable_sfx = !global.settings.enable_sfx;
				}
			},
			{
				name: "buttons",
				text: function() { return LANG.text_buttons+string(global.settings.buttons)+"%"; },
				action: function() {
					global.settings.buttons -= 25;
					if (global.settings.buttons < 0) { global.settings.buttons = 100;}
					
					obDirection.image_alpha=	global.settings.buttons/100
					obJump.image_alpha=			global.settings.buttons/100
					oBpause.image_alpha=		global.settings.buttons/100
				}
			},

			{
				name: "assist",
				text: function() { return LANG.text_assist; },
				action: function() {
					menu = menus.assist;
					option_index = 0;
				}
			},
			{
				name: "language",
				text: function() { 
					return LANG.text_language+lang_get();
				},
				action: function() {
				var _langs = ["EN","PT-BR","JA","ES","IT","ZH"]; //set language order
					var _lang_index = array_find_index(_langs,lang_get()); //find position of current
					_lang_index++; //go to next
					if (_lang_index >= array_length(_langs)) { _lang_index = 0; } //wrap around
				
					lang_set(_langs[_lang_index]); //update current language				 
				
					if (room=RoomMenu or room=RoomMenu2 or room=RoomCredits or room=RoomCreditsAlves  or room=Room100)
					{
						roomname=" "
						_yy = 64;//104-ceil(_menu_ops/2)*_menu_y_gap;
					}
					else
					{
						var name=LANG[$ room_get_name(room)]
						//roomname=string_delete(name,1,4) //remove the level number
						roomname=name
						_yy = 73;//104-ceil(_menu_ops/2)*_menu_y_gap;
					}
				
				}
			},
			{
				name: "back",
				text: function() { return LANG.text_back; },
				action: function() {
					menu = menus.main;
					option_index = 0;
					oSaveManager.save = true;
				}
			},
		],
		assist: [
			{
				name: "colorblind",
				text: function() { return LANG.text_colorblind+(global.settings.filter ? LANG.text_ON : LANG.text_OFF); },
				action: function() {
					global.settings.filter = !global.settings.filter;
				}
			},
			{
				name: "gamespeed",
				text: function() { return LANG.text_speed+string(global.settings.gamespd)+"%"; },
				action: function() {
					global.settings.gamespd -= 10;
					if (global.settings.gamespd <= 40) { global.settings.gamespd = 100;}
					game_set_speed((global.settings.gamespd/100)*60,gamespeed_fps)
				}
			},
			{
				name: "back",
				text: function() { return LANG.text_back; },
				action: function() {
					menu = menus.options;
					option_index = 0;
				}
			},
		],
	}
}


menu = menus.main; //set current menu
option_index = 0; //currently selected option index
option = menu[option_index]; //currently selected option struct