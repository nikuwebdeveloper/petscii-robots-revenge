event_inherited();
if obj_control_main.gameMode == "gameplay"
{
	if mode != "dead"
	{
		//die
		if hp <= 0
		{
			mode = "dead";
			pass = true; //pass through
		}
		if place_meeting(x,y,obj_effect_emp)
		{
			mode = "stun"
		}
		if obj_control_main.tick //global ticking clock
		{
			if mode == "alert" //if alerted by player
			{
				if distance_to_object(alertTarget) >= 16
				{
					//find all enemies and add them to the grid if they're not you
					var numInstances = instance_number(obj_parent_enemy);
					for (var i = 0; i < numInstances; i++) 
					{
					   var instance = instance_find(obj_parent_enemy, i);
						if instance.id != id
						{
							mp_grid_add_instances(grid, instance, false);
						}
					}
					//add locked doors
					var numInstanceDoor = instance_number(obj_parent_env_door);
					for (var i = 0; i < numInstanceDoor; i++) 
					{
					   var instance = instance_find(obj_parent_env_door, i);
						if instance.locked
						{
							mp_grid_add_instances(grid, instance, false);
						}
					}
					//add all environmental objects
					mp_grid_add_instances(grid, obj_parent_env, false); //environmental objects
				
					if mp_grid_path(grid, path, x, y, alertTarget.x,alertTarget.y, false) //if path is possible
					{
						path_start(path, 16, path_action_stop, false);
					}
				}
				else
				{
					mode = "attack"; //attack if you're within range
				}
			}
			else if mode == "attack"
			{
				if !instance_exists(spark) //make sparks
				{
					spark = instance_create_depth(alertTarget.x, alertTarget.y, depth, obj_effect_spark_temp)
				}
				if distance_to_object(alertTarget) > 16 //follow target again if too far away
				{
					mode = "alert";
				}
				if !alertTarget.gibSwitch //if dead but not gibbed yet
				{
					mode = "idle";
					alertTarget = noone;//reset
				}
			}
			else if mode == "idle"
			{
				if alertTarget != noone //switch to alert
				{
					mode = "alert";
				}
				if place_meeting(x+reachX, y+reachY, obj_parent_solid) //bounce off objects
				{
					//reverse directions
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
			else if mode == "confuse"
			{
				if confuseTimer == confuseTimerMax
				{
					confuseTimer = 0;
					mode = "idle";
				}
				else
				{
					confuseTimer++;
				}
				var rand = irandom_range(0,3);
				var xx = 0;
				var yy = 0;
				if rand == 0
				{
					dir = "up";
					yy = -16;
				}
				else if rand == 1
				{
					dir = "down";
					yy = 16;
				}
				else if rand == 2
				{
					dir = "left";
					xx = -16
				}
				else if rand == 3
				{
					dir = "right";
					xx = 16
				}	
				if !place_meeting(x+xx, y+yy,obj_parent_solid)
				{
					x += xx;
					y += yy;
				}
			}
			else if mode == "stun"
			{
				canMove = true;
				image_speed = 0;
				if stunTimer == stunTimerMax
				{
					canMove = false;
					image_speed = 1;
					stunTimer = 0;
					mode = "idle"
				}
				else
				{
					stunTimer++;
				}
				alertTarget = noone;
			}
			//set sprites for directions
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
			path_end(); //end path after moving one clock tick
			mp_grid_clear_all(grid); //clear grid so that it can be updated (might be unnecessary)
		}
	}
	else if mode == "dead"
	{
		if deathSwitch
		{
			canMove = true;
			deathSwitch = false;
			obj_control_main.enemyNumHoverbot--;
			sprite_index = spr_enemy_hoverbot_dead
		}
	}
}