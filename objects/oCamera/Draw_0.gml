//Room Border
if (room != RoomIntro0) && (room != RoomIntro1) && (room != RoomIntro2)
	&& (room != RoomIntro3) && (room != RoomMenu) && (room != RoomCredits)
	&& (room != RoomFinal) && (room != Room100) {

	draw_sprite_stretched_ext(sRoomBorder, 0, -30, -30, room_width+60, room_height+60,nice_black,1);
}


