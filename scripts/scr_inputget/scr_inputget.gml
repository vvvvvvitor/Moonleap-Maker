// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_inputget()
{
	if (!key_up_axis_pressed and !key_down_axis_pressed) {
		key_axis_pressed = false;
	}
	
	//if(!key_axis_pressed){
	if (key_up_axis_pressed or key_down_axis_pressed) {
		key_axis_pressed = true;
	}

	//get inputs
	if (oCamera.arcade==false)
	{
		
		//If we are on switch, call the switch input script instead
		if (os_type == os_switch) {
			input_switch_get();
			exit;
		}
		
		key_down_axis_pressed=(gamepad_axis_value(0,gp_axislv)>0.3)
		key_up_axis_pressed=(gamepad_axis_value(0,gp_axislv)<-0.3)
		
		
		key_right_pressed= keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right)  or gamepad_button_check(0,gp_padr) or (gamepad_axis_value(0,gp_axislh)>0.3) or obDirection.key_right;
		key_left_pressed= keyboard_check_pressed(ord("A")) or (keyboard_check_pressed(vk_left)  or gamepad_button_check(0,gp_padl)) or (gamepad_axis_value(0,gp_axislh)<-0.3) or  obDirection.key_left;
		
		key_right= keyboard_check(ord("D")) or keyboard_check(vk_right)  or gamepad_button_check(0,gp_padr) or (gamepad_axis_value(0,gp_axislh)>0.3) or obDirection.key_right;
		key_left= keyboard_check(ord("A")) or (keyboard_check(vk_left)  or gamepad_button_check(0,gp_padl)) or (gamepad_axis_value(0,gp_axislh)<-0.3) or  obDirection.key_left;
		key_down_notpressed= keyboard_check(ord("S")) or keyboard_check(vk_down) or gamepad_button_check(0,gp_padd) or obDirection.key_down
		key_down= keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down) or gamepad_button_check_pressed(0,gp_padd) or obDirection.key_down
		key_up= keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up) or gamepad_button_check_pressed(0,gp_padu)  or obDirection.key_up 
		key_jump_pressed=  keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("X")) or keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(0,gp_face1) or gamepad_button_check_pressed(0,gp_face2) or gamepad_button_check_pressed(0,gp_face3) or obJump.key_jump;
		key_jump=  keyboard_check(vk_space) or keyboard_check(ord("X")) or keyboard_check(ord("Z")) or gamepad_button_check(0,gp_face1) or gamepad_button_check(0,gp_face2) or gamepad_button_check(0,gp_face3)  or obJump.key_jump;
		key_start= keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0,gp_start) or oBpause.key_start;
		key_reset= keyboard_check_pressed(ord("R")) or gamepad_button_check_pressed(0,gp_select) //or gamepad_button_check_pressed(0,gp_shoulderlb) 
	}
	else

	{
		key_right=  keyboard_check(vk_right)  
		key_left= keyboard_check(vk_left)
		key_right_pressed=  keyboard_check_pressed(vk_right)  
		key_left_pressed= keyboard_check_pressed(vk_left)
		key_down=keyboard_check(vk_down) 
		key_up=keyboard_check(vk_up) 
		key_jump_pressed=  keyboard_check_pressed(ord("B")) or keyboard_check_pressed(ord("E")) or keyboard_check_pressed(ord("H"))
		key_jump=   keyboard_check(ord("B")) or keyboard_check(ord("E"))  or keyboard_check(ord("H"))
		key_start= keyboard_check_pressed(ord("M")) or oBpause.key_start;
		key_reset= keyboard_check_pressed(ord("R"))
	}
	

}



