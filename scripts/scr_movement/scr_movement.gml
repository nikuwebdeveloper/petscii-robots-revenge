function func_move(dir, mover, partner, reachX, reachY)
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
	
	
	
	
//	if dir == "up"
//	{
//		if place_empty(x,y-dist, obj_parent_solid)
//		{
//			y = y - dist;
//		}
//	}
//	else if dir == "down"
//	{
//		if place_empty(x,y+dist, obj_parent_solid)
//		{
//			y = y + dist;
//		}
//	}
//	else if dir == "left"
//	{
//		if place_empty(x-dist,y, obj_parent_solid)
//		{
//			x = x - dist;
//		}
//	}
//	else if dir == "right"
//	{
//		if place_empty(x+dist,y, obj_parent_solid)
//		{
//			x = x + dist;
//		}
//	}
//}