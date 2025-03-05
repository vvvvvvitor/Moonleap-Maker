draw_sprite_ext(sprite_index, image_index, x+drawx, y+drawy+drawplus, image_xscale, image_yscale, 0, c_white, 1)


if sprite_exists(icon) {
	var _x_size = sprite_get_width(sprite_index) * image_xscale
	var _y_size = sprite_get_height(sprite_index) * image_yscale
	
	draw_sprite(icon, 0, x + _x_size * 0.25, y + _y_size * 0.25)
}

// Draw tooltip
if is_hovering() {
	draw_text(global.level_maker_mouse_x + 8, global.level_maker_mouse_y - 8, tooltip)
}