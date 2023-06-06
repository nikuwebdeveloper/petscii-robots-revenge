if obj_control_main.gameMode == "gameplay"
{
	if !dead
	{
		//change sprites
		//if moving, keep value but if still, count down to change sprite
		if x != xprevious or y != yprevious
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
		//set sprite for standing still
		if x == xprevious and y == yprevious
		{
			if timerStill == 0
			{
				if obj_control_inventory.currentWeapon == "none"
				{
					sprite_index = spr_player_vic_idle_unarmed
				}
				else
				{
					sprite_index = spr_player_vic_idle_pistol
				}				
				if dir == "up"
				{
					image_index = 0;
				}
				else if dir == "down"
				{
					image_index = 2;
				}
				else if dir == "left"
				{
					image_index = 3;
				}
				else if dir == "right"
				{
					image_index = 1;
				}		
			}
		}
	}
}

				//if !obj_control_input.input_shoot_right_press and !obj_control_input.input_shoot_up_press and !obj_control_input.input_shoot_left_press and !obj_control_input.input_shoot_down_press
				//{