var halign = draw_get_halign();
var valign = draw_get_halign();

var fAtual = oCamera.font

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

nox_set_wave(2.25, 0.75, 1, "~")


if(!fim_fade){
	//draw_text_color(room_width/2,room_height/2-10,LANG.titulo[titulo_atual], cores[cor_titulo_atual], cores[cor_titulo_atual], cores[cor_titulo_atual], cores[cor_titulo_atual], 1);

	draw_text_nox(room_width/2,room_height/2-10,"~"+ LANG.titulo[titulo_atual] +"~",0,12,320,false,1,fAtual,cores[cor_titulo_atual])
	draw_text_color(room_width/2,room_height/2+10,LANG.nome[nome_atual], cores[cor_nome_atual], cores[cor_nome_atual], cores[cor_nome_atual], cores[cor_nome_atual], 1);
}else{
	draw_text_color(room_width/2,room_height+20+y_move,LANG.titulo_art, c_preto3, c_preto3, c_preto3, c_preto3, 1);
	var next_y = 0;
	for(var i = 0; i < array_length(LANG.nomes_art);i++){
		draw_text_color(room_width/2,room_height+20+y_move + 20 * (1+i) ,LANG.nomes_art[i], c_branco2, c_branco2, c_branco2, c_branco2, 1);
		next_y = room_height+20+y_move + 20 * (1+i);
	}
	//*
	draw_text_color(room_width/2,next_y+40,+LANG.titulo_tester, c_preto3, c_preto3, c_preto3, c_preto3, 1);
	//draw_text_nox(room_width/2,next_y+40,"~"+ LANG.titulo[titulo_atual] +"~",0,12,320,false,1,fAtual,cores[cor_titulo_atual])
	next_y+=40;
	
	for(var i = 0; i < array_length(LANG.nomes_testers1);i++){
		draw_text_color((room_width/2)-64,next_y + 20, LANG.nomes_testers1[i], c_branco2, c_branco2, c_branco2, c_branco2, 1);
		draw_text_color((room_width/2)+64,next_y + 20, LANG.nomes_testers2[i], c_branco2, c_branco2, c_branco2, c_branco2, 1);
		next_y += 20;
	}
	//*	
	
	if lang_get()="JA" or lang_get()="IT" //show: translation by "name"
	{
		//*
		draw_text_color(room_width/2,next_y+40,LANG.titulo_trans, c_preto3, c_preto3, c_preto3, c_preto3, 1);
	
		next_y+=40;
	
		for(var i = 0; i < array_length(LANG.nomes_trans);i++){
			draw_text_color(room_width/2,next_y + 20, LANG.nomes_trans[i], c_branco2, c_branco2, c_branco2, c_branco2, 1);
			next_y += 20;
		}
		//*	
	}
	
	draw_text_color(room_width/2,next_y+40,LANG.titulo_agradecimentos, c_preto3, c_preto3, c_preto3, c_preto3, 1);
	
	///*
	next_y += 40;
	for(var i = 0; i < array_length(LANG.nomes_agradecimento);i++){
		draw_text_color(room_width/2,next_y + 20 + (20) ,LANG.nomes_agradecimento[i], c_branco2, c_branco2, c_branco2, c_branco2, 1);
		next_y = next_y + 20 + (20);
		draw_text_color(room_width/2,next_y+20,LANG.agradecimento[i], c_preto3, c_preto3, c_preto3, c_preto3, 1);
		
		draw_text_nox(room_width/2,next_y+20+20,"~"+LANG.agradecimento_extra[i]+"~",0,12,320,false,1,fAtual,c_preto3)
		//draw_text_color(room_width/2,next_y+20+20,LANG.agradecimento_extra[i], c_preto3, c_preto3, c_preto3, c_preto3, 1);
		
		
		if(LANG.agradecimento_extra[i] != ""){
			next_y += 20;
		}
		next_y += 10;
	}
//*
	next_y+=40;
	draw_text_color(room_width/2,next_y+40,LANG.titulo_obrigado, c_preto3, c_preto3, c_preto3, c_preto3, 1);
	
	next_y+=40;
	
	for(var i = 0; i < array_length(LANG.nomes_obrigado1);i++){
		
		draw_text_color((room_width/2)-64,next_y + 20, LANG.nomes_obrigado1[i], c_branco2, c_branco2, c_branco2, c_branco2, 1);
		draw_text_color((room_width/2)+64,next_y + 20, LANG.nomes_obrigado2[i], c_branco2, c_branco2, c_branco2, c_branco2, 1);
		next_y += 20;
	}
//*	
	next_y+=40;
	
	for(var i = 0; i < array_length(LANG.finais_titulo);i++){
		draw_text_color(room_width/2,next_y+20,LANG.finais_titulo[i], c_preto3, c_preto3, c_preto3, c_preto3, 1);
		next_y+=20;
		draw_text_color(room_width/2,next_y + 20,LANG.finais_nome[i], c_branco2, c_branco2, c_branco2, c_branco2, 1);
		next_y+=20;
		next_y += 10;
	}
	
	next_y+=80;
	
	if(next_y+40 <= room_height /2 and y_obrigado != room_height/2){
		y_obrigado = room_height/2;
		alarm[0] = game_get_speed(gamespeed_fps) ;
	}else{
		if(!(y_obrigado == room_height/2)){
			y_obrigado = next_y +40;
		}
	}
	
	draw_sprite(sFlowerBackground,0,0,y_obrigado-room_height/2);
	draw_text_nox(room_width/2,y_obrigado-60,"~"+LANG.agradecimento_final+"~",0,12,320,false,1,fAtual,c_preto3)

	//*/
}
draw_set_font(fAtual);
draw_set_halign(halign);
draw_set_valign(valign);