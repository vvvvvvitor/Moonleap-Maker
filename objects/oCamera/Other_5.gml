/// @description Insert description here
// You can write your code in this editor
effect_clear()
if surface_exists(surfdebug) {surface_free(surfdebug);}
ds_list_clear(global.audio_list)
matrix_stack_clear()