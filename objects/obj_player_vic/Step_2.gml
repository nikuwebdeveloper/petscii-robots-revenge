if obj_control_main.gameMode == "gameplay"
{
	if !dead
	{
		//change sprites
		//if moving, keep value but if still, count down to change sprite
		if x != xprevious or y != yprevious
		{
			timerStill = 10;
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
				if currentWeapon == "none"
				{
					sprite_index = spr_player_vic_walk_up_unarmed
				}
			}
			else if dir == "down"
			{
				if currentWeapon == "none"
				{
					sprite_index = spr_player_vic_walk_down_unarmed
				}
			}
		}
		//set left right walking sprite
		else if x != xprevious
		{
			if dir == "left"
			{
				if currentWeapon == "none"
				{
					sprite_index = spr_player_vic_walk_left_unarmed
				}
			}
			else if dir == "right"
			{
				if currentWeapon == "none"
				{
					sprite_index = spr_player_vic_walk_right_unarmed
				}
			}			
		}
		//set sprite for standing still
		if x == xprevious and y == yprevious
		{
			if timerStill == 0
			{
				if currentWeapon == "none"
				{
					sprite_index = spr_player_vic_idle_unarmed
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