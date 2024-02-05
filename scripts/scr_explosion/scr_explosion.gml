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
//	diagonals
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
		if effect != obj_effect_plasma{
		func_blast_move(16,-16, i)}
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
		if effect != obj_effect_plasma{
		func_blast_move(16,16, i)}
	}
	for (var i = 1; i < range; i++)
	{
		if !place_meeting(x-(16*i), y-(16*i),obj_env_wall)
		{
			instance_create_depth(x-(16*i),y-(16*i),depth,effect);// up left
		}
		else
		{
			break;
		}
		if effect != obj_effect_plasma{
		func_blast_move(-16,-16, i)}
	}
	for (var i = 1; i < range; i++)
	{
		if !place_meeting(x-(16*i), y+(16*i),obj_env_wall)
		{
			instance_create_depth(x-(16*i),y+(16*i),depth,effect);// down left
		}
		else
		{
			break;
		}
		if effect != obj_effect_plasma{
		func_blast_move(-16,16, i)}
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
		if effect != obj_effect_plasma{
		func_blast_move(0,-16, i)}
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
		if effect != obj_effect_plasma{
		func_blast_move(0,16, i)}
	}
	for (var i = 1; i < range+1; i++)
	{

		if !place_meeting(x-(16*i),y,obj_env_wall)
		{
			instance_create_depth(x-(16*i),y,depth,effect);// left
		}
		else
		{
			break;
		}
		if effect != obj_effect_plasma{
		func_blast_move(-16,0, i)}
	}
	for (var i = 1; i < range+1; i++)
	{

		if !place_meeting(x+(16*i),y ,obj_env_wall)
		{
			instance_create_depth(x+(16*i),y,depth,effect);// right
			
		}
		else
		{
			break;
		}
		if effect != obj_effect_plasma{
		func_blast_move(16,0, i)}
	}
	instance_destroy();
}