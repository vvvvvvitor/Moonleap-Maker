/// @description Insert description here
// You can write your code in this editor
visible=change

scr_inputget();

if(star == 16){exit;}

if(change){
	//change = false;
	
	if key_jump_pressed=true or key_reset=true or key_reset=true {instance_destroy() instance_create_layer(x,y,layer,oSpecial4)}
	if(!key_left_pressed and !key_right_pressed)
	{
		verificado = false;
	}
	if !apertou
	{
		if (key_left_pressed)
		{
			valor_sequencia = 0;
			apertou = true;
		}
		if (key_right_pressed and !apertou)
		{
			valor_sequencia = 1;
			apertou = true;
		}
	}
	else
	{
		valor_sequencia = -1;
		apertou = false;
	}


	if(apertou and !verificado){
		verificado = true;
		show_debug_message("foi " + string(sequencia_atual) + " "  + string(sequencia[sequencia_atual]) + " " + string(valor_sequencia))
		
		if(sequencia[sequencia_atual] == valor_sequencia){
			sequencia_atual+=1;
		}else{
			sequencia_atual = 0;
		}
		
		//image_index = sequencia_atual;
		
		if(sequencia_atual == array_length(sequencia)){
			done = true;
		}
	}
}



if done=true {with(instance_create_layer(oCamera.x+(320/2),oCamera.y+(180/2)+16,"Instances_2",oSuperStar)){starnumber=4} star=16}



