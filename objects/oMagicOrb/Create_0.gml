/// @description Insert description here
// You can write your code in this editor
night=true
ani=0
hsp=0
vsp=0
grav=0.125
hsp_plus=0
flash=0

colapproach=0
if !audio_is_playing(sndPush){audio_play_sfx(sndPush,true,-17,0)}

change=false
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

sonx=0
sony=0


cooldown=0


if instance_exists(oSpaceDay) or instance_exists(oFlowerDay)or instance_exists(oDunDay) {trueblack=true} else {trueblack=false}

if instance_exists(oNeutralFlag) 
{neutral=true}

/*
var cu=self
instance_create_layer(x-320,y,layer,oMagicOrbClone,{daddy:cu})
instance_create_layer(x+320,y,layer,oMagicOrbClone,{daddy:cu})
instance_create_layer(x,y+180,layer,oMagicOrbClone,{daddy:cu})
instance_create_layer(x,y-180,layer,oMagicOrbClone,{daddy:cu})

