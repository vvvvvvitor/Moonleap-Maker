/// @description Insert description here
// You can write your code in this editor
image_index=random_range(0,1)
hsp=0
vsp=0
neww=false
drawscale=1

// new movement code

jumped = false;
landed = false;

platform_target = 0;
wall_target     = 0;

on_ground_var = on_ground();

// Used for sub-pixel movement
cx = 0;
cy = 0;

c_left    = place_meeting(x - 1, y, oSolid);
c_right   = place_meeting(x + 1, y, oSolid);
sticking = false
