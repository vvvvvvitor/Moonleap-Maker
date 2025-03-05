if (os_type != os_switch) { instance_destroy(); exit; }

joycon_status = array_create(8,0); //-1 = dropped, 0 = no change, 1 = found

show_debug_message("[switch] os_type is nintendo switch");
	
switch_controller_support_set_defaults();
switch_controller_set_supported_styles(switch_controller_handheld | switch_controller_joycon_left | switch_controller_joycon_right | switch_controller_pro_controller | switch_controller_joycon_dual);
switch_controller_support_set_all( false // explainText 
	                                , false // identificationColours 
	                                , true    // leftJustifiedNumbers 
	                                , true // permitJoyConDual 
	                                , true // singleplayerOnly 
	                                , true // maintainExistingConnections 
	                                , 1 // minimumControllers 
	                                , 1 // maximumControllers 
									);