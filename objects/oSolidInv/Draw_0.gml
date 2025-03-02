if !instance_exists(oPlayer) {exit;}
var _dist = distance_to_point(oPlayer.x,oPlayer.y+8);

if _dist<16
{
	sprite_index=sSolidInv
	image_index=2
if _dist<8
{
	image_index=1
}

if _dist<1
{
	image_index=0
}

}
else
{
	image_index=3
//sprite_index=sEmpty
}

draw_self();










