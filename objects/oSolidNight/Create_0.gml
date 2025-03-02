/// @description Insert description here
// You can write your code in this editor
night=oCamera.night
ani=0

if oLevelMaker.style_selected=0{
	var sday=		sGrassGre; var snight=	sGrassOre
}
if oLevelMaker.style_selected=1{
	var sday=		sCloudDay; var snight=	sCloudNight
}
if oLevelMaker.style_selected=2{
	var sday=		sFlowerDay; var snight	=sFlowerNight
}
if oLevelMaker.style_selected=3{
	var sday=		sSpaceGre; var snight=	sSpacePurple
}
if oLevelMaker.style_selected=4{
	var sday=		sDunDay; var snight=	sDunNight
}
if night=true {sprite_index=snight image_index=0} else {sprite_index=sday image_index=2}
