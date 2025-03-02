/// @description Insert description here
// You can write your code in this editor
/*
var i_d = ds_map_find_value(async_load, "id");

if(i_d == d_levelName)
    if(ds_map_find_value(async_load, "status"))
        if(ds_map_find_value(async_load, "result") != ""){
            var _level_name = ds_map_find_value(async_load, "result");
            if(_level_name != "")
                save_level(_level_name);
        }
if(i_d == d_loadLevel)
{
    if(ds_map_find_value(async_load, "status"))
        if(ds_map_find_value(async_load, "result") != ""){
            var _level_name = ds_map_find_value(async_load, "result");
			if(_level_name != "")
                load_level(_level_name);
		}
}






