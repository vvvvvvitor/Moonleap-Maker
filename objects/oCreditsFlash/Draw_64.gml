/// @description Insert description here
// You can write your code in this editor

var idx=image_index
if image_index<5 {idx=round(image_index)} else {idx=5}

pal_swap_set(sEndingPal,idx,false)

draw_surface(application_surface, 0,0);
pal_swap_reset()
