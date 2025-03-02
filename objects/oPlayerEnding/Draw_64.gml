/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//draw_text(32,32,round(time))


if trueblack=true {pal_swap_set(sPlayerPal,night+2,0)} else if oCamera.current_skin!=5 {pal_swap_set(sPlayerPal,night,0)} 


if flash=true
{
draw_sprite(sprite_index,image_index,x,y)
}
else
{
draw_sprite_ext(sprite_index,image_index,320/2,(180/2)+drawy,1,1,0,c_white,1)
}

pal_swap_reset()