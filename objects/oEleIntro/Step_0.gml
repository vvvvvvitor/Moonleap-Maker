/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
time+=0.0125

if time=2 {instance_create_layer(x,y-4,"Instances_2",oEleEye) audio_play_sfx(snd_ending,false,-8.3,0)}
if time=2.5 {var eye=instance_create_layer(x,y-4,"Instances_2",oEleEye) eye.image_xscale=-1}

if time=4 {oCamera.endnight=oPlayer.night room_goto(RoomFinal) }

oPlayer.numb=10