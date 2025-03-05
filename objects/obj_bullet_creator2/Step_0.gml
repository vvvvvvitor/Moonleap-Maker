numero=2;
if can_work=true
{
	if instance_exists(oPlayerEnding)
	{
		x=obj_boss.x+lengthdir_x(obj_boss.raio,(numero*45)+obj_boss.direcao)
		y=(obj_boss.y)+lengthdir_y(obj_boss.raio,(numero*45)+obj_boss.direcao)
	}
	else
	{
		x=obj_boss.x+lengthdir_x(obj_boss.raio,(numero*45)+obj_boss.direcao)
		y=obj_boss.y+lengthdir_y(obj_boss.raio,(numero*45)+obj_boss.direcao)
	}

}