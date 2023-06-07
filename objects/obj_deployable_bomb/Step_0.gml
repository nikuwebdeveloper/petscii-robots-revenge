event_inherited();
if timer == maxTimer
{
	instance_create_depth(x,y,depth,obj_effect_explosion_damage); //center
	//diagonals
	for (var i = 1; i < range; i++)
	{
		if !place_meeting(x+(16*i), y-(16*i),obj_env_wall)
		{
			instance_create_depth(x+(16*i),y-(16*i),depth,obj_effect_explosion_damage); //up right
		}
		else
		{
			break;
		}
	}
	for (var i = 1; i < range; i++)
	{
		if !place_meeting(x+(16*i), y+(16*i),obj_env_wall)
		{
			instance_create_depth(x+(16*i),y+(16*i),depth,obj_effect_explosion_damage); //down right
		}
		else
		{
			break;
		}
	}
	for (var i = 1; i < range; i++)
	{
		if !place_meeting(x-(16*i), y-(16*i),obj_env_wall)
		{
			instance_create_depth(x-(16*i),y-(16*i),depth,obj_effect_explosion_damage); //up left
		}
		else
		{
			break;
		}
	}
	for (var i = 1; i < range; i++)
	{
		if !place_meeting(x-(16*i), y+(16*i),obj_env_wall)
		{
			instance_create_depth(x-(16*i),y+(16*i),depth,obj_effect_explosion_damage); //down left
		}
		else
		{
			break;
		}
	}
	//cardinal directions
	for (var i = 1; i < range+1; i++)
	{
		if !place_meeting(x, y-(16*i),obj_env_wall)
		{
			instance_create_depth(x,y-(16*i),depth,obj_effect_explosion_damage); //up
		}
		else
		{
			break;
		}
	}
	for (var i = 1; i < range+1; i++)
	{
		if !place_meeting(x, y+(16*i),obj_env_wall)
		{
			instance_create_depth(x,y+(16*i),depth,obj_effect_explosion_damage); //down
		}
		else
		{
			break;
		}
	}
	for (var i = 1; i < range+1; i++)
	{
		if !place_meeting(x-(16*i),y,obj_env_wall)
		{
			instance_create_depth(x-(16*i),y,depth,obj_effect_explosion_damage); //left
		}
		else
		{
			break;
		}
	}
	for (var i = 1; i < range+1; i++)
	{
		if !place_meeting(x+(16*i),y ,obj_env_wall)
		{
			instance_create_depth(x+(16*i),y,depth,obj_effect_explosion_damage); //right
		}
		else
		{
			break;
		}
	}

	instance_destroy();
}
else
{
	timer++;
}

//if moveSwitch
//{
//	moveSwitch = false;
//	if place_meeting(x,y,obj_deployable_bomb)
//	{
//		var rand = irandom_range(0,3);
//		if rand == 0
//		{
//			y = y + 16;
//		}
//		else if rand == 1
//		{
//			x = x + 16;
//		}
//		else if rand == 2
//		{
//			y = y - 16;
//		}
//		else if rand == 3
//		{
//			x = x - 16;
//		}	
//	}
//}