event_inherited();
if obj_control_main.gameMode == "gameplay"
{
	if !dead
	{
		if obj_control_main.tick
		{
			//bounce off walls
			if place_meeting(x+reachX, y+reachY, obj_parent_solid)
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
			//move
			func_move_empty("up",reachX,reachY);
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
}