event_inherited();
if canMove
{
	if place_empty(x,y-16,obj_parent_solid)
	{
		freeMoveUp = true;
	}
	else
	{
		if place_meeting(x,y-16,obj_player_vic)
		{
			freeMoveUp = true;
		}
		else
		{
			freeMoveUp = false;
		}
	}
	if place_empty(x,y+16,obj_parent_solid)
	{
		freeMoveDown = true;
	}
	else
	{
		if place_meeting(x,y+16,obj_player_vic)
		{
			freeMoveDown = true;
		}
		else
		{
			freeMoveDown = false;
		}
	}
	if place_empty(x-16,y,obj_parent_solid)
	{
		freeMoveLeft = true;
	}
	else
	{
		if place_meeting(x-16,y,obj_player_vic)
		{
			freeMoveLeft = true;
		}
		else
		{
			freeMoveLeft = false;
		}
	}
	if place_empty(x+16,y,obj_parent_solid)
	{
		freeMoveRight = true;
	}
	else
	{
		if place_meeting(x+16,y,obj_player_vic)
		{
			freeMoveRight = true;
		}
		else
		{
			freeMoveRight = false;
		}
	}
}