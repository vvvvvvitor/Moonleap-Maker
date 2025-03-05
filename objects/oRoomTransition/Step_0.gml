/// @description Insert description here
// You can write your code in this editor

/*
if wait=0
{
if newroomspr=noone
{newroomspr=sprite_create_from_surface(appsurf2,0,0,320,180,false,false,0,0)
px2=oPlayer.x
py2=oPlayer.y
}

oPlayer.x=xstart
oPlayer.y=ystart


}
x1=smooth_approach(x1,-320,0.05)
x2=smooth_approach(x2,0,0.05) 

px=smooth_approach(px,px2,0.05)
py=smooth_approach(py,py2,0.05)

wait-=1
if x2<1{
	with(all) {x=xstart y=ystart}
	instance_destroy() oPlayer.visible=true
	}


instance_create_layer(random_range(px-4,px+4),random_range(py-4,py+4),layer,oSpark)