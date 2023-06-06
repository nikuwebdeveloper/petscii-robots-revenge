event_inherited();
if obj_control_main.gameMode == "gameplay"
{
	if !dead
	{
		//die
		if hp <= 0
		{
			dead = true;
			pass = true;
		}
		if obj_control_main.tick //global ticking clock
		{
			if alert
			{
				if distance_to_object(obj_player_vic) >= 16
				{
					// Get the total number of instances of the object
					var numInstances = instance_number(obj_parent_enemy);

					// Loop through each instance of the object
					for (var i = 0; i < numInstances; i++) 
					{
					    // Find the instance using its ID
					   var instance = instance_find(obj_parent_enemy, i);
						if instance.id != id
						{
							mp_grid_add_instances(grid, instance, false);
						}
					}
					mp_grid_add_instances(grid, obj_parent_env, false);
					
					if mp_grid_path(grid, path, x, y, obj_player_vic.x,obj_player_vic.y, false) //create path
					{
						path_start(path, 16, path_action_stop, false);
					}
				}
			}
			else
			{
				if place_meeting(x+reachX, y+reachY, obj_parent_solid) //bounce off walls
				{
					if dir == "up"
					{
						dir = "down";
					}
					else if dir == "down"
					{
						dir = "up";
					}
					else if dir == "left"
					{
						dir = "right";
					}
					else if dir == "right"
					{
						dir = "left";
					}
				}
				func_move_empty("up",reachX,reachY); //actually move
			}
			//set sprites
			if dir == "up"
			{
				sprite_index = spr_enemy_hoverbot_up;
			}
			if dir == "down"
			{
				sprite_index = spr_enemy_hoverbot_down;
			}
			if dir == "left"
			{
				sprite_index = spr_enemy_hoverbot_left;
			}
			if dir == "right"
			{
				sprite_index = spr_enemy_hoverbot_right;
			}
		}
		else
		{
			path_end(); 
			mp_grid_clear_all(grid);
		}
	}
	else
	{
		sprite_index = spr_enemy_hoverbot_dead
	}
}