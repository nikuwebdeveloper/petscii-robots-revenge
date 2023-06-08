if canSearch
{
	if searched
	{
		image_index = 1;
	}
	if hp <= 0
	{
		image_index = 2;
	}
}
if object_index == obj_env_barrel
{
	if hp <= 0
	{
		if boomSwitch
		{
			boomSwitch = false;
			image_index = 1;
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
		}
	}
}