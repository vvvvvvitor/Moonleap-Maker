background_layers = ["BackgroundForest", "BackgroundClouds", "BackgroundFlowers", "BackgroundSpace", "BackgroundDungeon"]


hide_backgrounds()
update_background()


function update_background() {
	var _style = oLevelMaker.style_selected
	
	if _style < array_length(background_layers) {
		var _new_layer_id = layer_get_id(background_layers[_style])
		// TODO: Use posmod instead of that inline
		var _previous_layer_id = layer_get_id(background_layers[_style - 1 != -1 ? _style - 1 : array_length(background_layers) - 1])
	
	
		if _previous_layer_id != -1 && _new_layer_id != -1 {
			layer_set_visible(_previous_layer_id, false)
			layer_set_visible(_new_layer_id, true)
		}
	}
}

function hide_backgrounds() {
	for (var _bg_idx = 0; _bg_idx < array_length(background_layers); _bg_idx++) {
		var _layer_id = layer_get_id(background_layers[_bg_idx])
		
		layer_set_visible(_layer_id, false)	
	}
	
}