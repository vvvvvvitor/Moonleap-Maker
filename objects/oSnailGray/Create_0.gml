/// @description Insert description here
// You can write your code in this editor
sindex=sprite_index
iindex=image_index
xindex=image_xscale

night=false
ani=0
hsp=-(image_xscale*0.55)
vsp=0
grav=0.08


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

palette_index=5
