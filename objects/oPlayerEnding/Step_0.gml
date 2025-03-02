/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
			if oCamera.current_skin=5
{
	if night=false
	{
		PlayerIdle=		sPlayerIdle5
		PlayerRun=		sPlayerRun5
		PlayerJump=		sPlayerJump5
		PlayerSit=		sPlayerSit5
		PlayerClimb=	sPlayerClimb5
		PlayerDead=		sPlayerDead5
		PlayerEnding=	sPlayerEnding5
		PlayerEndingFlash=	sPlayerEndingFlash5
		PlayerHappy=	sPlayerHappy5
	}
	else
	{	
		PlayerIdle=		sPlayerIdle6
		PlayerRun=		sPlayerRun6
		PlayerJump=		sPlayerJump6
		PlayerSit=		sPlayerSit6
		PlayerClimb=	sPlayerClimb6
		PlayerDead=		sPlayerDead6
		PlayerEnding=	sPlayerEnding6
		PlayerEndingFlash=	sPlayerEndingFlash6
		PlayerHappy=		sPlayerHappy6		
	}
}



direcao+=dir //faz a mira girar

if direcao>360 {direcao=-360} //relacionado a mira

time+=0.0166666666666667

if time=6  { TweenEasyMove(x,y,x,180/2,0,725,EaseInOutSine) sprite_index=PlayerEnding image_index=0 image_speed=0}

if y<200/2 {drawy=smooth_approach(drawy,0,0.02) image_speed=1} else {}

//if drawy<(overlay+0.1){image_speed=1}

if sprite_index=PlayerEnding {if image_index>10 {image_index=10}}

repeatime+=1


  
if repeatime>40 and sprite_index=PlayerEnding 
	{
	repeatime=0 
	xx=random_range(x-8,x+8)
	yy=random_range(y-8,y+8)
	instance_create_layer(xx,yy,"Instances_2",oSpark)
	}
	
	if time>20.75 { if sprite_index=PlayerEnding {image_index=0} flash=true sprite_index=PlayerEndingFlash image_speed=1}
	
	if time>21
	{
	if time<26 {dir=2*(bullet_spd/2)}

	scr_bullet_create(8,(6-(bullet_spd))+rate,dir,bullet)
	bullet_spd=approach(bullet_spd,2,0.1)
	
	}
	
	if time>26
	{
	dir=approach(dir,8,0.01)
	rate=approach(rate,-9,0.01)
	}
	
	if time>30
	{	if !instance_exists(oEndFlash)
		{instance_create_layer(xx,yy,"Instances_2",oEndFlash)}
		}
		
		if sprite_index=PlayerEndingFlash {if image_index>5 {image_index=5}}
		
