/// @description  OnGround();
function on_ground() {

	if vsp<0 {return false}
	return place_meeting(x, y + 1, oSolid) || (place_meeting(x, y + 1, oPlatGhost) && !place_meeting(x, y, oPlatGhost));


}

