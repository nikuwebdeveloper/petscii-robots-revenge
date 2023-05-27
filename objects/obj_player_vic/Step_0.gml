event_inherited();
if obj_control_main.gameMode == "gameplay"
{
	if !dead
	{
		//x and y distance for player's "reach" in front of them
		if dir == "up"
		{
			reachY = -16;
			reachX = 0;
		}
		else if dir == "down"
		{
			reachY = 16;
			reachX = 0;
		}
		else if dir == "left"
		{
			reachY = 0;
			reachX = -16;
		}
		else if dir == "right"
		{
			reachY = 0;
			reachX = 16;
		}
		//find push target
		if obj_control_input.input_toggle_push
		{
			if pushTarget != noone
			{
				pushTarget = noone;
			}
			else
			{
				pushTarget = instance_place(x + reachX, y + reachY, obj_parent_solid)
			}
		}
		//check for free moves
		//up
		var targetUp = instance_place(x, y-16, obj_parent_solid)
		if place_meeting(x,y-16, obj_parent_solid)
		{
			freeMoveUp = false;
		}
		else
		{
			freeMoveUp = true;
		}
		if targetUp != noone and pushTarget != noone
		{
			if targetUp.id != pushTarget
			{
				freeMoveUp = false;
			}
			else if targetUp.id == pushTarget
			{
				freeMoveUp = true;
			}
		}
		//down
		var targetDown = instance_place(x, y+16, obj_parent_solid)
		if place_meeting(x,y+16, obj_parent_solid)
		{
			freeMoveDown = false;
		}
		else
		{
			freeMoveDown = true;
		}
		if targetDown != noone and pushTarget != noone
		{
			if targetDown.id != pushTarget
			{
				freeMoveDown = false;
			}
			else if targetDown.id == pushTarget
			{
				freeMoveDown = true;
			}
		}
		//left
		var targetLeft = instance_place(x-16, y, obj_parent_solid)
		if place_meeting(x-16,y, obj_parent_solid)
		{
			freeMoveLeft = false;
		}
		else
		{
			freeMoveLeft = true;
		}
		if targetLeft != noone and pushTarget != noone
		{
			if targetLeft.id != pushTarget
			{
				freeMoveLeft = false;
			}
			else if targetLeft.id == pushTarget
			{
				freeMoveLeft = true;
			}
		}
		//right
		var targetRight = instance_place(x+16, y, obj_parent_solid)
		if place_meeting(x+16,y, obj_parent_solid)
		{
			freeMoveRight = false;
		}
		else
		{
			freeMoveRight = true;
		}
		if targetRight != noone and pushTarget != noone
		{
			if targetRight.id != pushTarget
			{
				freeMoveRight = false;
			}
			else if targetRight.id == pushTarget
			{
				freeMoveRight = true;
			}
		}
		
		//movement
		//off moves are when the player moves outside of a tick
		//up
		if obj_control_input.input_move_up_press
		{
			dir = "up";
			move = true;
		}
		else if obj_control_input.input_move_down_press
		{
			dir = "down";
			move = true;
		}
		else if obj_control_input.input_move_left_press
		{
			dir = "left";
			move = true;
		}
		else if obj_control_input.input_move_right_press
		{
			dir = "right";
			move = true;
		}		
		
		if move or offMove
		{
			if obj_control_main.tick
			{
				func_move(dir, id, pushTarget, reachX, reachY)
				move = false;
				offMove = false;
			}
			else
			{
				offMove = true;
			}
		}
		
		
		
		//if obj_control_input.input_move_up_press or offUp
		//{
		//	dir = "up";
		//	if obj_control_main.tick
		//	{
		//		if instance_exists(pushTarget)
		//		{
		//			if pushTarget.freeMoveUp and freeMoveUp
		//			{
		//				if place_meeting(x+reachX, y+reachY,pushTarget)
		//				{
		//					with (pushTarget)
		//					{
		//						y = y - 16;
		//					}
		//					y = y - 16;
		//				}
		//				else
		//				{
		//					y = y - 16;
		//					with (pushTarget)
		//					{
		//						y = y - 16;
		//					}
		//				}
		//				offUp = false;
		//			}
		//		}
		//		else
		//		{
		//			func_move(dir);
		//			offUp = false;
		//		}
		//	}
		//	else
		//	{
		//		offUp = true;
		//	}
		//}
		//else if obj_control_input.input_move_left_press or offLeft
		//{
		//	dir = "left";
		//	if obj_control_main.tick
		//	{
		//		if instance_exists(pushTarget)
		//		{
		//			if pushTarget.freeMoveLeft and freeMoveLeft
		//			{
		//				if place_meeting(x+reachX, y+reachY,pushTarget)
		//				{
		//					x = x - 16;
		//					with (pushTarget)
		//					{
		//						x = x - 16;
		//					}
		//				}
		//				else
		//				{
		//					with (pushTarget)
		//					{
		//						x = x - 16;
		//					}
		//					x = x - 16;
		//				}
		//				offLeft = false;
		//			}
		//		}
		//		else
		//		{
		//			func_move(dir);
		//			offLeft = false;
		//		}
		//	}
		//	else
		//	{
		//		offLeft = true;
		//	}
		//}
		//else if obj_control_input.input_move_right_press or offRight
		//{
		//	dir = "right";
		//	if obj_control_main.tick
		//	{
		//		if instance_exists(pushTarget)
		//		{
		//			if pushTarget.freeMoveRight and freeMoveRight
		//			{
		//				if place_meeting(x+reachX, y+reachY,pushTarget)
		//				{
		//					x = x + 16;
		//					with (pushTarget)
		//					{
		//						x = x + 16;
		//					}
		//				}
		//				else
		//				{
		//					with (pushTarget)
		//					{
		//						x = x + 16;
		//					}
		//					x = x + 16;
		//				}
		//				offRight = false;
		//			}
		//		}
		//		else
		//		{
		//			func_move(dir);
		//			offRight = false;
		//		}
		//	}
		//	else
		//	{
		//		offRight = true;
		//	}
		//}
		//else if obj_control_input.input_move_down_press or offDown
		//{
		//	dir = "down";
		//	if obj_control_main.tick
		//	{
		//		if instance_exists(pushTarget)
		//		{
		//			if pushTarget.freeMoveDown and freeMoveDown
		//			{
		//				if place_meeting(x+reachX, y+reachY,pushTarget)
		//				{
		//					y = y + 16
		//					with (pushTarget)
		//					{
		//						y = y + 16
		//					}
		//				}
		//				else
		//				{
		//					with (pushTarget)
		//					{
		//						y = y + 16
		//					}
		//					y = y + 16
		//				}
		//				offDown = false;
		//			}
		//		}
		//		else
		//		{
		//			func_move(dir);
		//			offDown = false;
		//		}
		//	}
		//	else
		//	{
		//		offDown = true;
		//	}
		//}
	}
}