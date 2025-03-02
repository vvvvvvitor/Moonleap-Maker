if (parent != -1)
{
	if sprite_index=sVineSegment or sprite_index=sVineSegmentMac
	{
		var black=make_color_rgb(0,0,72)
		if hasvine=true {draw_sprite_ext(sprite_index,image_index,x,y,1,1,90,c_white,1)}
	draw_line_width_colour(x, y, round(parent.x), round(parent.y), 2, black,black);
	}
else
	{
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,90,c_white,1)
	}
}