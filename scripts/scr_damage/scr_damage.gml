function explosionX(parent, size)
{
	var drawExp = true;

	var depthNew = -y - x
	var targetObject = obj_wall;
	audio_play_sound(sound_explosion,0,false)
	//up
	for (var i=0; i < size; i++)
	{
		var target = collision_line(x,y,x,y-(i*16),targetObject,false,true)
		var bomb = instance_create_depth(x,y-(i*16),depthNew, obj_explosion_bomb)
		var wallTarget = instance_place(parent.x,parent.y+8,obj_wall)
		if wallTarget != noone
		{
			drawExp = false
		}
		bomb.draw = drawExp;
		if target != noone
		{
			break;
		}
	}
	//right
	for (var i=0; i < size; i++)
	{
		var target = collision_line(x,y,x+(i*16),y,targetObject,false,true)
		var bomb = instance_create_depth(x+(i*16),y,depthNew, obj_explosion_bomb)
		var wallTarget = instance_place(parent.x+8,parent.y,obj_wall)
		if wallTarget != noone
		{
			drawExp = false
		}
		bomb.draw = drawExp;
		if target != noone
		{
			break;
		}
	}
	//down
	for (var i=0; i < size; i++)
	{
		var target = collision_line(x,y,x,y+(i*16),targetObject,false,true)
		var bomb = instance_create_depth(x,y+(i*16),depthNew, obj_explosion_bomb)
		var wallTarget = instance_place(parent.x,parent.y+8,obj_wall)
		if wallTarget != noone
		{
			bomb.draw = drawExp;
			break;
		}
		if target != noone
		{
			break;
		}
	}
	//left
	for (var i=0; i < size; i++)
	{
		var target = collision_line(x,y,x-(i*16),y,targetObject,false,true)
		var bomb = instance_create_depth(x-(i*16),y,depthNew, obj_explosion_bomb)
		var wallTarget = instance_place(parent.x,parent.y+8,obj_wall)
		if wallTarget != noone
		{
			drawExp = false
		}
		bomb.draw = drawExp;
		if target != noone
		{
			break;
		}
	}
	//up right
	for (var i=0; i < size-1; i++)
	{
		var target = collision_line(x,y,x+(i*16),y-(i*16),targetObject,false,true)
		var bomb = instance_create_depth(x+(i*16),y-(i*16),depthNew, obj_explosion_bomb)
		var wallTarget = instance_place(parent.x+8,parent.y,obj_wall)
		if wallTarget != noone
		{
			drawExp = false
		}
		if instance_exists(bomb){
		bomb.draw = drawExp;}
		if target != noone
		{
			break;
		}
	}
	//down right
	for (var i=0; i < size-1; i++)
	{
		var target = collision_line(x,y,x+(i*16),y+(i*16),targetObject,false,true)
		var bomb = instance_create_depth(x+(i*16),y+(i*16),depthNew, obj_explosion_bomb)
				var wallTarget = instance_place(parent.x,parent.y+8,obj_wall)
		if wallTarget != noone
		{
			drawExp = false
		}
		bomb.draw = drawExp;
		if target != noone
		{
			break;
		}
	}
	//down left
	for (var i=0; i < size-1; i++)
	{
		var target = collision_line(x,y,x-(i*16),y+(i*16),targetObject,false,true)
		var bomb = instance_create_depth(x-(i*16),y+(i*16),depthNew, obj_explosion_bomb)
				var wallTarget = instance_place(parent.x,parent.y+8,obj_wall)
		if wallTarget != noone
		{
			drawExp = false
		}
		bomb.draw = drawExp;
		if target != noone
		{
			break;
		}
	}
	//up left
	for (var i=0; i < size-1; i++)
	{
		var target = collision_line(x,y,x-(i*16),y-(i*16),targetObject,false,true)
		var bomb = instance_create_depth(x-(i*16),y-(i*16),depthNew, obj_explosion_bomb)
		var wallTarget = instance_place(parent.x,parent.y+8,obj_wall)
		if wallTarget != noone
		{
			drawExp = false
		}
		bomb.draw = drawExp;
		if target != noone
		{
			break;
		}
	}
}