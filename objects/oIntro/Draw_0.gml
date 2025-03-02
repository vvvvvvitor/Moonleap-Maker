/// @description Insert description here
// You can write your code in this editor
//draw_self()
draw_self()
draw_set_color(text_color);
draw_set_font(oCamera.font)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
nox_set_wave(2.25, 1, 1, "~")

if (time < 4) 
{
    // Desenha a mensagem na tela
     //draw_text(320/2,y+180/2,text);
	 draw_text_nox(320/2,y+180/2,"~"+text+"~",0,12,320)
}
else 
{
    // Desenha a mensagem na tela	
	 //{draw_text(320/2,y+180-16,text)}
	 draw_text_nox(320/2,y+180-16,text,0,12,320)

}

if sure=0
{
    // Desenha a mensagem na tela
    draw_set_color(c_branco1);
    draw_text(320/2,16,LANG.skipintro);
}















