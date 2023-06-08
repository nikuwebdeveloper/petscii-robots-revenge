event_inherited();
if obj_control_main.gameMode == "gameplay"
{
	if !dead
	{
		//change sprites
		if x != xprevious or y != yprevious //if moving, keep value but if still, count down to change sprite
		{
			timerStill = 12;
		}
		else if x == xprevious and y == yprevious
		{
			if timerStill > 0
			{
				timerStill--;
			}
		}
		if pushTarget == noone
		{
			//set up down walking sprite
			if y != yprevious
			{
				if dir == "up"
				{
					if obj_control_inventory.currentWeapon == "none"
					{
						sprite_index = spr_player_vic_walk_up_unarmed
					}
					else
					{
						sprite_index = spr_player_vic_walk_up_pistol
					}
				}
				else if dir == "down"
				{
					if obj_control_inventory.currentWeapon == "none"
					{
						sprite_index = spr_player_vic_walk_down_unarmed
					}
					else
					{
						sprite_index = spr_player_vic_walk_down_pistol
					}	
				}
			}
			//set left right walking sprite
			else if x != xprevious
			{
				if dir == "left"
				{
					if obj_control_inventory.currentWeapon == "none"
					{
						sprite_index = spr_player_vic_walk_left_unarmed
					}
					else
					{
						sprite_index = spr_player_vic_walk_left_pistol
					}		
				}
				else if dir == "right"
				{
					if obj_control_inventory.currentWeapon == "none"
					{
						sprite_index = spr_player_vic_walk_right_unarmed
					}
					else
					{
						sprite_index = spr_player_vic_walk_right_pistol
					}
				}			
			}
			if x == xprevious and y == yprevious
			{
				if timerStill == 0
				{
					sprite_index = spr_player_vic_idle_unarmed;
					if dir == "up"
					{
						image_index = 0;
					}
					if dir == "right"
					{
						image_index = 1;
					}
					if dir == "down"
					{
						image_index = 2;
					}
					if dir == "left"
					{
						image_index = 3;
					}					
				}
			}
			
		}
		else if pushTarget != noone
		{
			if x == xprevious and y == yprevious //still
			{
				if timerStill == 0
				{
					sprite_index = spr_player_vic_idle_unarmed
					if pushDir == "up"
					{
						image_index = 0;
					}
					if pushDir == "right"
					{
						image_index = 1;
					}
					if pushDir == "down"
					{
						image_index = 2;
					}
					if pushDir == "left"
					{
						image_index = 3;
					}		
				}
			}
			else if x != xprevious or y != yprevious //moving
			{
				if pushDir == "up"
				{
					sprite_index = spr_player_vic_walk_up_unarmed;
				}
				if pushDir == "right"
				{
					sprite_index = spr_player_vic_walk_right_unarmed;
				}
				if pushDir == "down"
				{
					sprite_index = spr_player_vic_walk_down_unarmed;
				}
				if pushDir == "left"
				{
					sprite_index = spr_player_vic_walk_left_unarmed;
				}	
			}
		}
	}
}

//if obj_control_main.tick
//{
//	if (move) and (x==xprevious and y == yprevious)
//	{
//		errorMove = true;
//		show_debug_message("error");
//	}
//}