/// @description Insert description here
// You can write your code in this editor
nox_set_wave(2.25, 0.75, 1, "~") //fast wave

var halign = draw_get_halign();
var valign = draw_get_valign();

var fAtual = oCamera.font

draw_set_font(fntSmall);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
var yy = 15;
//draw_sprite(sprSecrets, 0, room_width/2-10, yy+40);
//draw_text_color(room_width/2+10,yy+40,string(total_secrets), cor_progresso, cor_progresso, cor_progresso, cor_progresso, 1);
//draw_text_color(room_width/2+10+string_width(total_secrets),yy+40,"/"+string(secrets_existentes), cor_total, cor_total, cor_total, cor_total, 1);

draw_sprite(sprPombos, 0, room_width/2-10, yy+48);
draw_text_color(room_width/2+10,yy+48,string(total_pombos), cor_progresso, cor_progresso, cor_progresso, cor_progresso, 1);
draw_text_color(room_width/2+10+string_width(total_pombos),yy+48,"/"+string(pombos_existentes), cor_total, cor_total, cor_total, cor_total, 1);

draw_sprite(sprSpecial, image_index, room_width/2-10, yy+62);
draw_text_color(room_width/2+10,yy+62,string(total_special), cor_progresso, cor_progresso, cor_progresso, cor_progresso, 1);
draw_text_color(room_width/2+10+string_width(total_special),yy+62,"/"+string(specials_existentes), cor_total, cor_total, cor_total, cor_total, 1);

draw_sprite(sprLevels, 0, room_width/2-10, yy+76);
draw_text_color(room_width/2+10,yy+76,string(total_level), cor_progresso, cor_progresso, cor_progresso, cor_progresso, 1);
draw_text_color(room_width/2+10+string_width(total_level),yy+76,"/"+string(levels_existentes), cor_total, cor_total, cor_total, cor_total, 1);

draw_sprite(sprDeath, 0, room_width/2-10, yy+90);
draw_text_color(room_width/2+10,yy+90,string(total_deaths), cor_progresso, cor_progresso, cor_progresso, cor_progresso, 1);

draw_sprite(sprPercent, 0, room_width/2-10, yy+104);
draw_set_color(cor_progresso)
if porcentagem<120 { draw_text_nox(room_width/2+10,yy+104,string(floor(porcentagem))			,0,12,320,false,1)}
if porcentagem=120 { draw_text_nox(room_width/2+10,yy+104,"~120~"	,0,12,320,false,1)}
if porcentagem=1000 {draw_text_nox(room_width/2+10,yy+104,"$1000$"	,0,12,320,false,1)}

if(go){
	// Desenha a mensagem na tela
	draw_set_font(fAtual);
	draw_set_halign(halign);
	draw_set_valign(valign);
	
	draw_set_halign(fa_center);
	draw_set_color(c_branco1);
	draw_text(320/2,16,LANG.skipintro);
}

draw_set_font(fAtual);
draw_set_halign(halign);
draw_set_valign(valign);