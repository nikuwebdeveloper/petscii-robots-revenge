event_inherited();
if obj_main.gameMode == GAMEMODE.GAMEPLAY
{
	if mode != MODE.DEAD
	{
		// find xReach, yReach
		reach(facing)
		//die
		if hp <= 0
		{
			mode = MODE.DEAD;
			pass = true; //pass through
		}
		if place_meeting(x,y,obj_effect_emp)
		{
			mode = MODE.STUN
		}
		if obj_main.tick //global ticking clock
		{
			if mode == MODE.ALERT //if alerted by player
			{
				if distance_to_object(alertTarget) > 8
				{
					//find all enemies and add them to the grid if they're not you
					for (var i = 0; i < instance_number(obj_parent_enemy); i++) 
					{
						var instance = instance_find(obj_parent_enemy, i);
						if instance != id
						{
							mp_grid_add_instances(grid, instance, false);
						}
					}
					//add locked doors
					// var numInstanceDoor = instance_number(obj_parent_env_door);
					// for (var i = 0; i < numInstanceDoor; i++) 
					// {
					//   var instance = instance_find(obj_parent_env_door, i);
					// 	if instance.locked
					// 	{
					// 		mp_grid_add_instances(grid, instance, false);
					// 	}
					// }
					
					//add all environmental objects
					mp_grid_add_instances(grid, obj_parent_env, false);
					//if path is possible
					if mp_grid_path(grid, path, x - 4, y - 4, alertTarget.x - 4, alertTarget.y - 4, false)
					{
						path_start(path, 8, path_action_stop, false);
					}
				}
				else
				{
					mode = MODE.ATTACK; //attack if you're within range
				}
			}
			else if mode == MODE.ATTACK
			{
				if !instance_exists(spark) //make sparks
				{
					spark = instance_create_depth(alertTarget.x, alertTarget.y, depth, obj_effect_spark_temp)
				}
				if distance_to_object(alertTarget) > 8 //follow target again if too far away
				{
					mode = MODE.ALERT;
				}
				if !alertTarget.gibSwitch //if dead but not gibbed yet
				{
					mode = MODE.IDLE;
					alertTarget = noone;//reset
				}
			}
			else if mode == MODE.IDLE
			{
				if alertTarget != noone //switch to alert
				{
					mode = MODE.ALERT;
				}
				// bounce off objects
				if place_meeting(x + xReach, y + yReach, obj_parent_solid) 
				{
					//reverse directions
					if facing == DIR.UP
					{
						facing = DIR.DOWN;
					}
					else if facing == DIR.DOWN
					{
						facing = DIR.UP;
					}
					else if facing == DIR.LEFT
					{
						facing = DIR.RIGHT;
					}
					else if facing == DIR.RIGHT
					{
						facing = DIR.LEFT;
					}
				}
				// move
				move_empty(facing, xReach, yReach); 
			}
			else if mode == MODE.CONFUSE
			{
				if confuseTimer == confuseTimerMax
				{
					confuseTimer = 0;
					mode = MODE.IDLE;
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
					facing = DIR.UP;
					yy = -8;
				}
				else if rand == 1
				{
					facing = DIR.DOWN;
					yy = 8;
				}
				else if rand == 2
				{
					facing = DIR.LEFT;
					xx = -8
				}
				else if rand == 3
				{
					facing = DIR.RIGHT;
					xx = 8
				}	
				if !place_meeting(x + xx, y + yy,obj_parent_solid)
				{
					x += xx;
					y += yy;
				}
			}
			else if mode == MODE.STUN
			{
				moveable = true;
				image_speed = 0;
				if stunTimer == stunTimerMax
				{
					moveable = false;
					image_speed = 1;
					stunTimer = 0;
					mode = MODE.IDLE
				}
				else
				{
					stunTimer++;
				}
				alertTarget = noone;
			}
			//set sprites for directions
			if facing == DIR.UP
			{
				sprite_index = spr_enemy_hoverbot_up;
			}
			if facing == DIR.DOWN
			{
				sprite_index = spr_enemy_hoverbot_down;
			}
			if facing == DIR.LEFT
			{
				sprite_index = spr_enemy_hoverbot_left;
			}
			if facing == DIR.RIGHT
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
	else if mode == MODE.DEAD
	{
		obj_main.switchEnemyDeadCount = true
		var target = instance_create_depth(x,y,depth,obj_corpse)
		target.sprite_index = spr_enemy_hoverbot_dead
		instance_destroy()
	}
}