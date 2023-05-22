if obj_control_main.gameMode == "gameplay"
{
	if !dead
	{
		//movement
		//off moves are when the player moves outside of a tick
		//up
		if obj_control_input.input_move_up_press or offUp
		{
			dir = "up";
			if obj_control_main.tick
			{
				func_move("up");
				offUp = false;
			}
			else
			{
				offUp = true;
			}
		}
		//accounts for the player wanting to hold or tap the movement button
		//off moves are not included to prevent player from overshooting intended distance
		else if obj_control_input.input_move_up_hold
		{
			dir = "up";
			if obj_control_main.tick
			{
				func_move("up");
			}
		}
		//down
		if obj_control_input.input_move_down_press or offDown
		{
			dir = "down";
			if obj_control_main.tick
			{
				func_move( "down");
				offDown = false;
			}
			else
			{
				offDown = true;
			}
		}
		else if obj_control_input.input_move_down_hold
		{
			dir = "down";
			if obj_control_main.tick
			{
				func_move("down");
			}
		}
		//left
		if obj_control_input.input_move_left_press or offLeft
		{
			dir = "left";
			if obj_control_main.tick
			{
				func_move("left");
				offLeft = false;
			}
			else
			{
				offLeft = true;
			}
		}
		else if obj_control_input.input_move_left_hold
		{
			dir = "left";
			if obj_control_main.tick
			{
				func_move("left");
			}
		}
		//right
		if obj_control_input.input_move_right_press or offRight
		{
			dir = "right";
			if obj_control_main.tick
			{
				func_move("right");
				offRight = false;
			}
			else
			{
				offRight = true;
			}
		}
		else if obj_control_input.input_move_right_hold
		{
			dir = "right";
			if obj_control_main.tick
			{
				func_move("right");
				offRight = false;
			}
		}
	}
}