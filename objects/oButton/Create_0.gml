xs = x
ys = y
level_name = "";
d_levelName = "";
load_name = "";
d_loadLevel = "";
holding=0
drawy=0
drawx=0
scale=1

start_pos_x = x;
start_pos_y = y;
//if(image_index == 6){
//}

small_size = 20;

drawplus=0
drawtarget=0

pressed = function() {}
held    = function() {}

// Use a list to add mouse shortucts
// mouse {sdasda, asda },
// key {sdasdas. asdasd}
shortcuts = []

scr_inputcreate()

function is_hovering() {
	return collision_point(global.level_maker_mouse_x,global.level_maker_mouse_y,self,false,false)
}

function shake() {
	// for (var i = 0; i != 60; i++) {
		show_debug_message("Shaking!")
	// }
}