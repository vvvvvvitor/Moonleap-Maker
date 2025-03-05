/// @description Insert description here
// You can write your code in this editor
if !instance_exists(oPlayer) {exit;}
if distance_to_point(oPlayer.x,oPlayer.y)>180 {exit;}
if instance_exists(oSuperStar) {exit;}

if fail=true
{
	star=0
	change=false
	fail=false
	time1=noone
	time2=noone
	time3=noone
	time4=noone
	time5=noone
	time6=noone
	time7=noone
	time8=noone
	time9=noone

}

if change=true
{
	change=false
	if star=0 {time1=current_time star=1 exit;}
	if star=1 {time2=current_time star=2 exit;}
	
	if star=2
	{

		time3=current_time
		if (time3-time2)>(time2-time1) {star=3 exit;} else {fail=true exit;}
	}
	
	if star=3
	{
		time4=current_time
		if (time4-time3)>(time3-time2) {star=4 exit;} else {fail=true exit;}
	}
	
		if star=4
	{
		time5=current_time
		if (time5-time4)>(time4-time3) {star=5 exit;} else {fail=true exit;}
	}

		if star=5
	{
		time6=current_time
		if (time6-time5)>(time5-time4) {star=6 exit;} else {fail=true exit;}
	}
	
		if star=6
	{
		time7=current_time
		if (time7-time6)>(time6-time5) {star=7 exit;} else {fail=true exit;}
	}
	
		if star=7
	{
		time8=current_time
		if (time8-time7)>(time7-time6) {star=8 exit;} else {fail=true exit;}
	}
	
		if star=8
	{
		time9=current_time
		if (time9-time8)>(time8-time7) {star=9 done=true exit;} else {fail=true exit;}
	}
}

if done=true and star=9
{
	
	with(instance_create_layer(oCamera.x+(320/2),oCamera.y+(180/2)+16,"Instances_2",oSuperStar)){starnumber=1} star=0
	
}


