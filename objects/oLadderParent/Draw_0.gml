/// @description Insert description here
// You can write your code in this editor
draw_self()

if startindex=0
{
	if global.settings.filter=true
	{draw_sprite_ext(sColorBlind16,1,x,y,image_xscale,image_yscale,0,c_white,1)
	if image_index=4 {draw_sprite_ext(sColorBlind16,1,x,y,image_xscale,image_yscale,0,c_white,1)}
	}
}

if startindex=1
{
	if global.settings.filter=true
	{draw_sprite_ext(sColorBlind16,0,x,y,image_xscale,image_yscale,0,c_white,1)
		if image_index=4 {draw_sprite_ext(sColorBlind16,0,x,y,image_xscale,image_yscale,0,c_white,1)}
	}
	

}