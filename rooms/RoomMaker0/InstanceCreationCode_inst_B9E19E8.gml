shortcuts = [vk_tab]

pressed = function() {
	audio_play_sfx(sndUiChange,false,-18.3,1)
	
	with oLevelMaker {
		if brush == Brushes.PAINT {
			cursor=3
			self.icon = sIconEraser
			brush = Brushes.ERASER
		} else {
			if brush == Brushes.ERASER {
				cursor=1
				self.icon = sIconPaint
				brush = Brushes.PAINT
			}
		}
	}
}

// 0= nothing 1=cursor 2=finger 3=eraser