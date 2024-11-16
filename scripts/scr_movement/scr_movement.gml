function reach(_facing)
{
	if _facing == DIR.UP
	{
		xReach = 0;
		yReach = -8
	}
	else if _facing == DIR.DOWN
	{
		xReach = 0;
		yReach = 8;
	}
	else if _facing == DIR.LEFT
	{
		xReach = -8;
		yReach = 0;
	}
	else if _facing == DIR.RIGHT
	{
		xReach = 8;
		yReach = 0;
	}
}

function move_push(facing, mover, partner, xReach, yReach)
{
	if place_empty(x +  xReach, y + yReach, obj_parent_solid) or place_meeting(x + xReach, y + yReach, partner)
	{
		with(partner)
		{
			if place_empty(x + xReach,y + yReach, obj_parent_solid) or place_meeting(x + xReach,y + yReach, mover)
			{
				x += xReach;
				y += yReach;
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
			x += xReach;
			y += yReach;
		}
	}
}

function move_empty(facing, xReach, yReach)
{
	if place_empty(x + xReach, y + yReach, obj_parent_solid)
	{
		x += xReach;
		y += yReach;
	}
}

function blast_move(xx,yy, i)
{
	var target = collision_line(x, y, x + (xx * i), y + (yy * i), obj_parent_env, false, true)
	if instance_exists(target)
	{
		with (target)
		{
			if moveable
			{
				if place_empty(x + xx,y + yy, obj_parent_solid)
				{
					x = x + xx;
					y = y + yy;
				}
			}
		}
	}
}