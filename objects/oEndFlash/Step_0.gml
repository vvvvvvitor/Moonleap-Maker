/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
oEndingBack.sprite_index=sEmpty
if image_index<2 {oEndingBack.sprite_index=sflashelper oEndingBack.image_index=1} 
if image_index<1 {oEndingBack.sprite_index=sflashelper oEndingBack.image_index=0}


if image_index>3 {room_goto(RoomCredits)}