/// @description freeze_game(milliseconds)
/// @param milliseconds
function freeze_game(argument0) {
	var duration=argument0;
	var t= current_time + duration;

	while (current_time < t) { };


}
