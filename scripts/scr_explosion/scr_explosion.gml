function func_explosion(type)
{
	if type == "bomb"
	{
		effect = obj_effect_explosion_damage
	}
	else if type == "plasma"
	{
		effect = obj_effect_plasma
	}
	instance_create_depth(x,y,depth,effect); //center
	//diagonals
	for (var i = 1; i < range; i++)
	{
		if !place_meeting(x+(16*i), y-(16*i),obj_env_wall)
		{
			instance_create_depth(x+(16*i),y-(16*i),depth,effect); //up right
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
			instance_create_depth(x+(16*i),y+(16*i),depth,effect); //down right
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
			instance_create_depth(x-(16*i),y-(16*i),depth,effect); //up left
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
			instance_create_depth(x-(16*i),y+(16*i),depth,effect); //down left
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
			instance_create_depth(x,y-(16*i),depth,effect); //up
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
			instance_create_depth(x,y+(16*i),depth,effect); //down
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
			instance_create_depth(x-(16*i),y,depth,effect); //left
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
			instance_create_depth(x+(16*i),y,depth,effect); //right
		}
		else
		{
			break;
		}
	}
	instance_destroy();
}