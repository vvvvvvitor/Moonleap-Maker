/// @description scr_bullet_create(qnt,bullet_rate,dir)
/// @param  qnt
/// @param  bullet_rate
/// @param  dir
/// @param  obj
function scr_bullet_create(argument0,argument1,argument2,argument3)
{
	dir=argument2
	bullet_rate_max=argument1
	
	bullet_rate+=1
	
		if bullet_rate>bullet_rate_max
	{
		if argument0=8
		{
			instance_create_layer(obj_bullet_creator1.x,obj_bullet_creator1.y,"Instances_2",argument3)
			instance_create_layer(obj_bullet_creator2.x,obj_bullet_creator2.y,"Instances_2",argument3)
			instance_create_layer(obj_bullet_creator3.x,obj_bullet_creator3.y,"Instances_2",argument3)
			instance_create_layer(obj_bullet_creator4.x,obj_bullet_creator4.y,"Instances_2",argument3)
			instance_create_layer(obj_bullet_creator5.x,obj_bullet_creator5.y,"Instances_2",argument3)
			instance_create_layer(obj_bullet_creator6.x,obj_bullet_creator6.y,"Instances_2",argument3)
			instance_create_layer(obj_bullet_creator7.x,obj_bullet_creator7.y,"Instances_2",argument3)
			instance_create_layer(obj_bullet_creator8.x,obj_bullet_creator8.y,"Instances_2",argument3)
			
		}
	
		if argument0=4
		{
			instance_create_layer(obj_bullet_creator2.x,obj_bullet_creator2.y,"Instances_2",argument3)
			instance_create_layer(obj_bullet_creator4.x,obj_bullet_creator4.y,"Instances_2",argument3)
			instance_create_layer(obj_bullet_creator6.x,obj_bullet_creator6.y,"Instances_2",argument3)
			instance_create_layer(obj_bullet_creator8.x,obj_bullet_creator8.y,"Instances_2",argument3)
			
		}
	
		if argument0=2
		{
			instance_create_layer(obj_bullet_creator4.x,obj_bullet_creator4.y,"Instances_2",argument3)
			instance_create_layer(obj_bullet_creator8.x,obj_bullet_creator8.y,"Instances_2",argument3)
			
		}
	
		if argument0=1
		{
			instance_create_layer(obj_bullet_creator1.x,obj_bullet_creator1.y,"Instances_2",argument3)
			
		}
		
		if argument0=0
		{
		
		}
		
		shake_gamepad(0.2,2)
		bullet_rate=0
		
	if bullet=oStarEnd {bullet=oDotEnd exit;}
	if bullet=oDotEnd	{bullet=oSparkEnd exit;}
	if bullet=oSparkEnd {if time>26 {bullet=oStarEnd} else {bullet=oDotEnd} exit;}
		
	}
	
	
	
	
}