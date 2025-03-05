
/* NOTES:

- This repository is based on Moonleap version 2.3.2, but with the SleepScreens removed and some levels missing, specifically Rooms 0 to 49.
- Rooms 60 to 63 were kept only as examples of how the levels in Moonleap were originally built.
- The maker_mode=true setting in the oIntro causes the game go straight to the RoomMaker0

- Some objects just didnt pause when oPause exists, thats a bug
- oSolidDay and oSolidNight were created for this levelmaker, in the game i use oGrassDay, oGrassNight, oCloudDay...
- the UI show plenty of oUndefined, it isn't ideal, need to do a solution for that
- Style stuff isn't done yet but the way enemies check what style of phase they are in is by checking if there is a GrassDay, CloudDay, FlowerDay and so on
based on that they update their colors
- oPlatGhost dont really rotate, in the game i use oPlatGhostL, oPlatGhostR and oPlatGhostInv...
- The plan is to eventually integrate Moonleap Maker into the Steam version of Moonleap, making it available as an option in the game menu

*/

global.game_state = GameState.EDITING

enum Brushes {
	PAINT,
	ERASER
}

yplus=0
xplus=0
nice_black=make_color_rgb(0,0,72)
nice_white=make_color_rgb(170,255,255)
nice_blue=$FFFFAA55




current_grid_obj=0
brush = Brushes.PAINT
cursor=0// 0= nothing 1=cursor 2=finger 3=eraser
insidelevel=false
time=0 //used for release the buttons
style_selected=0

instance_create_layer(x,y,layer,oPause);
oCamera.fancyeffects=false
mx=0

//x = type
//y = object

//x0 mostly neutral	//x1 mostly day				//x2 mostly night			//x3								//x4 unused, i plan to make stars fly with they werent colliding
obj[0,0]=oPlayer		obj[1,0]=oPlayerDir			obj[2,0]=oPlayerNeutral		obj[3,0]=oUndefined				obj[4,0]=oUndefined
obj[0,1]=oSolid			obj[1,1]=oSolidDay			obj[2,1]=oSolidNight		obj[3,1]=oBigSolid				obj[4,1]=oUndefined
obj[0,2]=oPlatGhost		obj[1,2]=oBrokenStone		obj[2,2]=oBrokenStoneBig	obj[3,2]=oSolidRamp/**/			obj[4,2]=oUndefined
obj[0,3]=oPermaSpike	obj[1,3]=oUndefined			obj[2,3]=oUndefined			obj[3,3]=oUndefined/**/			obj[4,3]=oUndefined
obj[0,4]=oStar			obj[1,4]=oStarColor			obj[2,4]=oStarRunning		obj[3,4]=oStarRunningColor		obj[4,4]=oStarFly
obj[0,5]=oLadderNeutral obj[1,5]=oLadderDay			obj[2,5]=oLadderNight		obj[3,5]=oUndefined/**/			obj[4,5]=oPlatGhostL
obj[0,6]=oSnailGray		obj[1,6]=oSnail				obj[2,6]=oSnailNight		obj[3,6]=oUndefined/**/			obj[4,6]=oPlatGhostR
obj[0,7]=oLadyGray		obj[1,7]=oLady				obj[2,7]=oLadyGiant			obj[3,7]=oLadyGiant4			obj[4,7]=oPlatGhostInv
obj[0,8]=oBat			obj[1,8]=oBatGiant			obj[2,8]=oUndefined			obj[3,8]=oUndefined/*baixo*/	obj[4,8]=oNeutralFlag
obj[0,9]=oMushGray		obj[1,9]=oMush				obj[2,9]=oMushGray			obj[3,9]=oUndefined				obj[4,9]=oUndefined
//obj[0,10]=oUndefined	obj[1,10]=oUndefined		obj[2,10]=oUndefined		obj[3,10]=oUndefined			obj[4,10]=oUndefined
obj[0,10]=oKey			obj[1,10]=oKeyTall			obj[2,10]=oKeyWide			obj[3,10]=oKeyTallWide			obj[4,10]=oUndefined //make different spr to differentiate the keys
obj[0,11]=oKeyDoor		obj[1,11]=oKeyDoorTall		obj[2,11]=oKeyDoorWide		obj[3,11]=oKeyDoorTallWide		obj[4,11]=oUndefined
obj[0,12]=oGrayOrb		obj[1,12]=oMagicOrb			obj[2,12]=oUndefined		obj[3,12]=oUndefined			obj[4,12]=oUndefined
obj[0,13]=oBird			obj[1,13]=oUndefined		obj[2,13]=oUndefined		obj[3,13]=oUndefined			obj[4,13]=oUndefined
obj[0,14]=oBlack		obj[1,14]=oUndefined		obj[2,14]=oUndefined		obj[3,14]=oUndefined			obj[4,14]=oUndefined
obj[0,15]=oUndefined	obj[1,15]=oUndefined		obj[2,15]=oUndefined		obj[3,15]=oUndefined			obj[4,15]=oUndefined

function get_x_y_from_object_index(_object_index){
	for (var yy = maxy; yy>=0; yy-=1) {
		for (var xx = maxx; xx>=0; xx-=1) {
			if(obj[xx,yy] == _object_index){
				return [xx,yy];
			}
		}
	}
}

currentx=0
currenty=0

selectmaxx=3
maxx=4
maxy=15

// Create Groups
group_player=array_create(0,0)
array_push(group_player,oPlayer,oPlayerDir,oPlayerNeutral)

group_canspin=array_create(0,0)
array_push(group_canspin,oMush,oMushGray,oStar,oLady,oLadyDay,oLadyGray,oBat,oPlatGhost)

group_canmirror=array_create(0,0)
array_push(group_canmirror,oSnailNight,oSnailGray,oSnail,oBat,oSolidRamp,oLady,oLadyDay,oLadyGray,oLadyGiant,oLadyGiant4)

group_16grid=array_create(0,0)
array_push(group_16grid,oSolid, oBrokenStone,oBigSolid,oBrokenStoneBig,oBat,oBlack,oSolidDay,oSolidNight, oBatVer)

function is_16_object(_object_index){
	return is_in_array(group_16grid,_object_index);
}
function is_mirror_object(_object_index){
	return is_in_array(group_canmirror,_object_index);
}
function is_spin_object(_object_index){
	return is_in_array(group_canspin,_object_index);
}
function is_player_object(_object_index){
	return is_in_array(group_player,_object_index);
}

enum SPRITE_POSITIONING_TYPE {
	CENTER,
	BOTTOM,
	TOP_LEFT,
	OFFSET5,
}

var _object_sizes = [
	[oPlayer, 16, 16			, SPRITE_POSITIONING_TYPE.BOTTOM],
	[oPlayerDir, 16, 16			],
	[oPlayerNeutral, 16, 16		],
	[oSolid, 16, 16				],
	[oSolidDay, 16, 16			, SPRITE_POSITIONING_TYPE.OFFSET5 ],
	[oSolidNight, 16, 16		, SPRITE_POSITIONING_TYPE.OFFSET5 ],
	[oBigSolid, 32, 32			],
	[oPlatGhost, 16, 16			],
	[oPlatGhostInv, 16, 16			],
	[oPlatGhostL, 16, 16			],
	[oPlatGhostR, 16, 16			],
	[oBrokenStone, 16, 16		],
	[oBrokenStoneBig, 32, 32	],
	[oSolidRamp, 32, 16			,SPRITE_POSITIONING_TYPE.CENTER ],
	[oPermaSpike, 16, 16		],
	[oStar, 16, 16				],
	[oStarColor, 16, 16			],
	[oStarRunning, 16, 16		],
	[oStarRunningColor, 16, 16	],
	[oStarFly, 16, 16			],
	[oLadderNeutral, 16, 16		, SPRITE_POSITIONING_TYPE.TOP_LEFT],
	[oLadderDay, 16, 16			, SPRITE_POSITIONING_TYPE.TOP_LEFT],
	[oLadderNight, 16, 16		, SPRITE_POSITIONING_TYPE.TOP_LEFT],
	[oSnailGray, 16, 16			, SPRITE_POSITIONING_TYPE.BOTTOM],
	[oSnail, 16, 16				, SPRITE_POSITIONING_TYPE.BOTTOM],
	[oSnailNight, 16, 16		, SPRITE_POSITIONING_TYPE.BOTTOM],
	[oLadyGray, 16, 16			, SPRITE_POSITIONING_TYPE.CENTER],
	[oLadyDay, 16, 16			, SPRITE_POSITIONING_TYPE.CENTER],
	[oLady, 16, 16				, SPRITE_POSITIONING_TYPE.CENTER],
	[oLadyGiant, 48, 16			, SPRITE_POSITIONING_TYPE.CENTER],
	[oBatVer, 32, 16			, SPRITE_POSITIONING_TYPE.CENTER],
	[oBat, 16, 16				, SPRITE_POSITIONING_TYPE.CENTER],
	[oBatGiant, 48, 16			, SPRITE_POSITIONING_TYPE.CENTER],
	[oBatSuperGiant, 64, 16		, SPRITE_POSITIONING_TYPE.CENTER],
	[oMushGray, 16, 16			],
	[oMush, 16, 16				],
	[oKey, 16, 16				],
	[oKeyTall, 16, 32			],
	[oKeyWide, 32, 16			],
	[oKeyTallWide, 32, 32		],
	[oKeyDoor, 16, 16			],
	[oKeyDoorTall, 16, 32		],
	[oKeyDoorWide, 32, 16		],
	[oKeyDoorTallWide, 32, 32	],
	[oGrayOrb, 16, 16			, SPRITE_POSITIONING_TYPE.BOTTOM],
	[oMagicOrb, 16, 16			, SPRITE_POSITIONING_TYPE.BOTTOM],
	[oBird, 16, 16				],
	[oBlack, 16, 16				],
];

object_to_size = ds_map_create();

tile_size = 8;

default_origin_type = SPRITE_POSITIONING_TYPE.TOP_LEFT;

function object_sprite_get_offset_typed(_object_index, _object_width, _object_height, _origin_type){
	
	//var _origin_type = default_origin_type;
	//var _object_width = 1;
	//var _object_height = 1;
	
	var _sprite = object_get_sprite(_object_index);

	//var _size = object_to_size[? _object_index];
	
	//if(_size != undefined){
	//	_object_width = _size[0];
	//	_object_height = _size[1];
	//	_origin_type = _size[2];
	//}
	
	var _offx = sprite_get_xoffset(_sprite);
	var _offy = sprite_get_yoffset(_sprite);
	var _w = sprite_get_width(_sprite);
	var _h = sprite_get_height(_sprite);
	
	switch(_origin_type){
		case SPRITE_POSITIONING_TYPE.OFFSET5: //guselect
			return [
				_offx-8,
				_offy-8
			];
		case SPRITE_POSITIONING_TYPE.TOP_LEFT:
			return [
				_offx,
				_offy
			];
		case SPRITE_POSITIONING_TYPE.BOTTOM:
			return [
				_offx-_w div 2+_object_width*tile_size div 2,
				_offy-_h+_object_height*tile_size,
			];
		case SPRITE_POSITIONING_TYPE.CENTER:
			return [
				_offx-_w div 2+_object_width*tile_size div 2,
				_offy-_h div 2+_object_height*tile_size div 2
			];
	}
}

function rotate_object_offset(_object_width, _object_height, _sprite_offset_x, _sprite_offset_y, _angle){
	
	var _half_width_object = (_object_width * tile_size) div 2;
	var _half_height_object = (_object_height * tile_size) div 2;
	
	_sprite_offset_x -= _half_width_object;
	_sprite_offset_y -= _half_height_object;
	
	var _dist = point_distance(0,0,_sprite_offset_x,_sprite_offset_y);
	var _dir = point_direction(0,0,_sprite_offset_x,_sprite_offset_y);
	
	_sprite_offset_x = lengthdir_x(_dist,_dir+_angle);
	_sprite_offset_y = lengthdir_y(_dist,_dir+_angle);
	
	_sprite_offset_x += _half_width_object;
	_sprite_offset_y += _half_height_object;
	
	return [_sprite_offset_x,_sprite_offset_y];
}

for(var _i = 0; _i < array_length(_object_sizes); _i++){
	var _v = _object_sizes[_i];
	
	var _origin_type = default_origin_type;
	if(array_length(_v) > 3){
		_origin_type = _v[3];
	}
	
	var _w = _v[1] div tile_size;
	var _h = _v[2] div tile_size;
	
	var _offset = object_sprite_get_offset_typed(_v[0],_w,_h,_origin_type);
	
	object_to_size[? _v[0]] = [_w,_h, _offset[0], _offset[1]];
}

scr_inputcreate()

room_tile_width =  room_width div tile_size;
room_tile_height = (room_height div tile_size) + tile_size;

object_grid = [];

for(var _x = 0; _x < room_tile_width; _x++){
	for(var _y = 0; _y < room_tile_height; _y++){
		object_grid[_x,_y] = -1;
	}	
}

function get_grid_object_hovering(_mouse_x, _mouse_y){
	for(var _x = 0; _x < room_tile_width; _x++){
		for(var _y = 0; _y < room_tile_height; _y++){
			var _val = object_grid[_x,_y];
			if(is_array(_val) && _val[0] == _x && _val[1] == _y){
				
				var _w = _val[3];
				var _h = _val[4];
				
				if(point_in_rectangle(_mouse_x, _mouse_y, _x*tile_size,_y*tile_size, (_x+_w)*tile_size, (_y+_h)*tile_size)){
					return _val;
				}
			}
		}	
	}
	return -1;
}

function remove_object_from_grid(_object_data){
	
	var _top_left_x = _object_data[0];
	var _top_left_y = _object_data[1];
	
	var _object_width = _object_data[3];
	var _object_height = _object_data[4];
	
	for(var _x = _top_left_x; _x < _top_left_x+_object_width; _x++){
		for(var _y = _top_left_y; _y < _top_left_y+_object_height; _y++){
			object_grid[_x,_y] = -1;
		}	
	}
}

function check_for_objects_in_grid_position(_top_left_x,_top_left_y,_object_index){
	
	var _object_width = 1;
	var _object_height = 1;

	var _size = object_to_size[? _object_index];

	if(_size != undefined){
		_object_width = _size[0];
		_object_height = _size[1];
	}
	
	//make sure the object stays inside the grid
	_top_left_x = clamp(_top_left_x,0, room_tile_width - _object_width);
	_top_left_y = clamp(_top_left_y,0, room_tile_height - _object_height);
	
	for(var _x = _top_left_x; _x < _top_left_x+_object_width; _x++){
		for(var _y = _top_left_y; _y < _top_left_y+_object_height; _y++){
			if(is_array(object_grid[_x,_y]))
				return true;
		}	
	}
	
	return false;
}

function remove_all_player_objects_from_grid(){
	for(var _x = 0; _x < room_tile_width; _x++){
		for(var _y = 0; _y < room_tile_height; _y++){
			var _val = object_grid[_x,_y];
			if(is_array(_val) && _val[0] == _x && _val[1] == _y){
				if(_val[2] == oPlayer || _val[2] == oPlayerDir || _val[2] == oPlayerNeutral){
					remove_object_from_grid(_val);
				}
			}
		}
	}
}

function remove_orb_from_grid(){
	for(var _x = 0; _x < room_tile_width; _x++){
		for(var _y = 0; _y < room_tile_height; _y++){
			var _val = object_grid[_x,_y];
			if(is_array(_val) && _val[0] == _x && _val[1] == _y){
				if(_val[2] == oMagicOrb || _val[2] == oGrayOrb){
					remove_object_from_grid(_val);
				}
			}
		}
	}
}

//TOP LEFT X AND Y ARE IN GRID INCREMENTS OF tile_size

function place_object_in_object_grid(_top_left_x,_top_left_y,_object_index, _xscale = 1, _angle = 0){
	
	var _object_width = 1;
	var _object_height = 1;

	var _size = object_to_size[? _object_index];

	if(_size != undefined){
		_object_width = _size[0];
		_object_height = _size[1];
	}
	
	var _object_data = [
		_top_left_x,
		_top_left_y,
		_object_index,
		_object_width,
		_object_height,
		_xscale,
		_angle
	];
	
	//make sure the object stays inside the grid
	_top_left_x = clamp(_top_left_x,0, room_tile_width - _object_width);
	_top_left_y = clamp(_top_left_y,0, room_tile_height - _object_height);
	
	for(var _x = _top_left_x; _x < _top_left_x+_object_width; _x++){
		for(var _y = _top_left_y; _y < _top_left_y+_object_height; _y++){
			object_grid[_x,_y] = _object_data;
		}	
	}
}

//----------------------
//default level:

//floor
place_object_in_object_grid(8*2, 7*2, oSolid);
place_object_in_object_grid(8*2+2, 7*2, oSolid);
place_object_in_object_grid(8*2+4, 7*2, oSolid);
place_object_in_object_grid(8*2+6, 7*2, oSolid);

place_object_in_object_grid(8*2, 6*2, oPlayer);

place_object_in_object_grid(8*2+6, 6*2, oStar);

//

function object_of_type_exists_in_editor(_object_index){
	for(var _x = 0; _x < room_tile_width; _x++){
		for(var _y = 0; _y < room_tile_height; _y++){
			var _val = object_grid[_x,_y];
			if(is_array(_val) && _val[2] == _object_index)
				return true;
		}
	}
	return false;
}

function start_level(){
	audio_play_sfx(sndStarGame,false,-18.3,1)
	hover_text = "";
	
	instance_destroy(oPause);
	
	switch (style_selected)
	{
	case 0: instance_create_layer(0,0,"Instances",o_grass_song)	break;
	case 1: instance_create_layer(0,0,"Instances",o_cloud_song)	break;
	case 2: instance_create_layer(0,0,"Instances",o_flower_song)	break;
	case 3: instance_create_layer(0,0,"Instances",o_space_song)	break;
	case 4: instance_create_layer(0,0,"Instances",o_dungeon_song)	break;
	}
	
	for(var _x = 0; _x < room_tile_width; _x++){
		for(var _y = 0; _y < room_tile_height; _y++){
			var _val = object_grid[_x,_y];
			if(is_array(_val) && _val[0] == _x && _val[1] == _y){
				var _obj_ind = _val[2];
				
				var _angle = _val[6];
				
				var _sprite = object_get_sprite(_obj_ind);
				
				var _object_width = 1;
				var _object_height = 1;
				var _sprite_offset_x = sprite_get_xoffset(_sprite);
				var _sprite_offset_y = sprite_get_yoffset(_sprite);

				var _size = object_to_size[? _obj_ind];

				if(_size != undefined){
					_sprite_offset_x = _size[2];
					_sprite_offset_y = _size[3];
				
					_object_width = _size[0];
					_object_height = _size[1];			
				}
			
				var _new_offset = rotate_object_offset(_object_width,_object_height,_sprite_offset_x,_sprite_offset_y,_angle);
				
				_sprite_offset_x = _new_offset[0];
				_sprite_offset_y = _new_offset[1];

				var _in_world_x = _x * tile_size + _sprite_offset_x;
				var _in_world_y = _y * tile_size + _sprite_offset_y;
				
				var _xscale = _val[5];
				
				instance_create_layer(_in_world_x, _in_world_y, "Instances", _obj_ind, { image_xscale: _xscale, image_angle: _angle });
			}
		}
	}
	
	
	with(oLevelMaker) {scr_update_style()}
	//game_save("level.savetemp")
		
	//oPlayer.inistar=instance_number(oStar)
	
	with (oBrokenStone)
	{
		brokenright=instance_place(x+1,y,oBrokenStone)
		brokenleft=instance_place(x-1,y,oBrokenStone)
		brokenup=instance_place(x,y-1,oBrokenStone)
		brokendown=instance_place(x,y+1,oBrokenStone)
	}
	
	if instance_exists(oPlayer) {
		oPlayer.inistar=instance_number(oStar)-1 //IDK why, just works
	}
	
	global.game_state = GameState.TESTING
	//show_message(oPlayer.inistar)
}

function delete_all_objects_from_grid(){
	for (var yy = maxy; yy>=0; yy-=1) {
		for (var xx = maxx; xx>=0; xx-=1) {
			remove_object_from_grid(obj[xx,yy]);
		}
	}
}

function delete_all_objects_from_level(){
	for (var yy = maxy; yy>=0; yy-=1) {
		for (var xx = maxx; xx>=0; xx-=1) {
			instance_destroy(obj[xx,yy]);
		}
	}
}

function end_level_and_return_to_editor(){
	//destroy the "song"
	instance_destroy(o_grass_song)	
	instance_destroy(o_cloud_song)	
	instance_destroy(o_flower_song)
	instance_destroy(o_space_song)	
	instance_destroy(o_dungeon_song)
	audio_stop_all()
	
	delete_all_objects_from_level();
	
	instance_create_layer(x,y,layer,oPause);
	
	global.game_state = GameState.EDITING
	
	just_entered_level_editor = true;
}


//CAMERA CODE

camera_current_interpolation = 0;

global.level_maker_mouse_x = mouse_x;
global.level_maker_mouse_y = mouse_y;

just_entered_level_editor = false;