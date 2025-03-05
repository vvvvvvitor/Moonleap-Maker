/// @description Insert description here
// You can write your code in this editor
//

scr_inputget();

if(star == 16){exit;}

if(change){
	
	//change = false;
	
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
		
		image_index = sequencia_atual;
		
		if(sequencia_atual == array_length(sequencia)){
			done = true;
		}
	}
}



if done=true
{
	var spct=oSpecial3Trigger
	
	with(instance_create_layer(spct.x+(spct.sprite_width/2),spct.y,"Instances_2",oSuperStar)){starnumber=3} star=16
}


