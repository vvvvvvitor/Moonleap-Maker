/// @description Insert description here
// You can write your code in this editor

if x>room_width{x=0 hsp=choose(-2,2,2.5,-2.5)   otherdv=random_range(0.25,1)}
if x<0 {x=room_width  hsp=choose(-2,2,2.5,-2.5) otherdv=random_range(0.25,1)}


    with (instance_place(x, y, oRopeSegment))
    {phy_linear_velocity_x = (other.hsp*other.otherdv) * 18;}






x+=hsp
y+=vsp