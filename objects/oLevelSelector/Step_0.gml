/// @description Insert description here
// You can write your code in this editor
key_right= keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right)  or gamepad_button_check_pressed(0,gp_padr) or obDirection.key_right;
key_left= keyboard_check_pressed(ord("A")) or (keyboard_check_pressed(vk_left)  or gamepad_button_check_pressed(0,gp_padl)) or obDirection.key_left;
key_down= keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down) or gamepad_button_check_pressed(0,gp_padd) or obDirection.key_down;
key_up= keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up) or gamepad_button_check_pressed(0,gp_padu) or obDirection.key_up;
key_start= keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0,gp_start) or keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("X")) or keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(0,gp_face1) or obJump.key_jump;

near_level=instance_nearest(x,y,oLevel)
if x=near_level.x and y=near_level.y {hsp=0 vsp=0}

if hsp=0 and vsp=0
{
if key_left=true and  (place_meeting(x-32,y,oLevel) or place_meeting(x-16,y,oLevel)) {hsp=-2 vsp=0}
if key_right=true and (place_meeting(x+32,y,oLevel) or place_meeting(x+16,y,oLevel)) {hsp=+2 vsp=0}
if key_down=true and  (place_meeting(x,y+32,oLevel) or place_meeting(x,y+16,oLevel)) {vsp=+2 hsp=0}
if key_up=true and    (place_meeting(x,y-32,oLevel) or place_meeting(x,y-16,oLevel)) {vsp=-2 hsp=0}

if key_start=true and near_level.color!=make_color_rgb(0,85,170)
{if !instance_exists(oTransition){audio_play_sfx(sndStarGame,false,-6.2,0)
	var trans=instance_create_layer(0,0,layer,oTransition)
	trans.target_room=near_level.level oCamera.levelselx=x oCamera.levesely=y}}
}

//logoy=smooth_approach(logoy,(180/2)-28,0.1)

if round(logoy)!=(180/2)-12 {if drawy!=y {drawy=smooth_approach(drawy,y,0.25)}}
else {drawy=y}

if near_level.color=make_color_rgb(0,85,170) {text="locked"} //se for preto

if near_level.color=make_color_rgb(170,255,255) {text="completed"}  //se for branco

if near_level.color=make_color_rgb(170,170,255)  {text="unlocked"} //se for azul