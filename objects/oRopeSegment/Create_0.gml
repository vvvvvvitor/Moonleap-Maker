

parent = -1;
increasedDamping = true;
drawx=x
drawy=y
time=180
hasvine=true


if instance_exists(oGrassDay)
{
	sprite_index=sVineSegment
	if os_type= os_macosx or os_type= os_switch or os_type= os_ios or os_type= os_android {sprite_index=sVineSegmentMac}
}


phy_rotation=90

think=0
