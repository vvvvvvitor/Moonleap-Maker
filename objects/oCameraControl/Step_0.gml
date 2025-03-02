/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
x=oCamera.x
y=oCamera.y

time+=1
if time<10
{oCamera.y=0}

if time=200
{
	with(oCamera)
	{
	TweenEasyMove(x,y,x,181,0,300,EaseInOutSine)
	}
}

if time=700 {sprite_index=sEndTrans}

if time>700
{
if image_index>5{room_goto(RoomCreditsAlves) instance_destroy()}
}