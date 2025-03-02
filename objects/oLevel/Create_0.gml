/// @description Insert description here
// You can write your code in this editor
drawy=94
level=asset_get_index(string_insert(image_index,"Room",8))

color=make_color_rgb(0,85,170)



//check if actual level is complete
var thislevel=string_insert(image_index,"Room",5)
var levelminusoom=string_replace(thislevel,"Room","r")
var loadvalue= variable_struct_get(oSaveManager.struct_main,levelminusoom) //0 =  not complete, >0.5 & <1.0 without bird, >1.0 complete
	
if loadvalue=1 {color=make_color_rgb(170,255,255) exit;}//fica branca, simbolizando que foi concluida

//check if is the first stage
var thislevel=string_insert(image_index,"Room",5)
if thislevel="Room0"
{color=make_color_rgb(170,170,255) exit;}//fica azul, simbolizando que o jogador pode jogar a fase


//check if previous level is complete
var prevlevel=string_insert(image_index-1,"Room",5)
var levelminusoom=string_replace(prevlevel,"Room","r")
var loadvalue= variable_struct_get(oSaveManager.struct_main,levelminusoom) //0 =  not complete, >0.5 & <1.0 without bird, >1.0 complete

if loadvalue=1 {color=make_color_rgb(170,170,255)}//fica azul, simbolizando que o jogador pode jogar a fase

//check if previous previous level is complete
var prevlevel=string_insert(image_index-2,"Room",5)
var levelminusoom=string_replace(prevlevel,"Room","r")
var loadvalue= variable_struct_get(oSaveManager.struct_main,levelminusoom) //0 =  not complete, >0.5 & <1.0 without bird, >1.0 complete
/// debug 
if oCamera.arcade=false {loadvalue=1}
///
if loadvalue=1 {color=make_color_rgb(170,170,255)}//fica azul, simbolizando que o jogador pode jogar a fase

if room_exists(level)=false {image_alpha=0.2}