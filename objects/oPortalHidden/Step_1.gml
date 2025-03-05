/// @description Insert description here
// You can write your code in this editor

if distance_to_object(oPlayer)<16
{
image_xscale=smooth_approach(image_xscale,1,0.25)
}
else if open=false
{
image_xscale=smooth_approach(image_xscale,0,0.25)
}