function func_reach(dir)
{
	if dir == "up"
	{
		reachX = 0;
		reachY = -16
	}
	else if dir == "down"
	{
		reachX = 0;
		reachY = 16;
	}
	else if dir == "left"
	{
		reachX = -16;
		reachY = 0;
	}
	else if dir == "right"
	{
		reachX = 16;
		reachY = 0;
	}
}

function func_move_push(dir, mover, partner, reachX, reachY)
{
	if place_empty(x+reachX,y+reachY, obj_parent_solid) or place_meeting(x+reachX,y+reachY, partner)
	{
		with(partner)
		{
			if place_empty(x+reachX,y+reachY, obj_parent_solid) or place_meeting(x+reachX,y+reachY, mover)
			{
				x = x + reachX;
				y = y + reachY;
				other.pushTargetBlocked = false;
			}
			else
			{
				other.pushTargetBlocked = true;
			}
		}
		if !instance_exists(partner)
		{
			pushTargetBlocked = false;
		}
		if pushTargetBlocked == false
		{
			//reset
			if instance_exists(partner)
			{
				pushTargetBlocked = true;
			}
			x = x + reachX;
			y = y + reachY;
		}
	}
}

function func_move_empty(dir, reachX, reachY)
{
	if place_empty(x+reachX,y+reachY, obj_parent_solid)
	{
		x = x + reachX;
		y = y + reachY;
	}
}