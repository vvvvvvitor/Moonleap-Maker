if global.game_state != GameState.PAUSED {
	if array_length(shortcuts) != 0 {
		for (var _shortcut_idx=0; _shortcut_idx<array_length(shortcuts); _shortcut_idx++) {
			var _shortcut = shortcuts[_shortcut_idx]
		
			switch (typeof(_shortcut)) {
				case "number":
					if keyboard_check_pressed(_shortcut) {
						pressed()
					}
				case "string":
					if keyboard_check_pressed(ord(_shortcut)) {
						pressed()
					}
			}
		}
	}
}