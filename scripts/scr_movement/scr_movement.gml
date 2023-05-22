function func_move(dir)
{
	var dist = 16;
	if dir == "up"
	{
		if place_empty(x,y-dist, obj_parent_solid)
		{
			y = y - dist;
		}
	}
	else if dir == "down"
	{
		if place_empty(x,y+dist, obj_parent_solid)
		{
			y = y + dist;
		}
	}
	else if dir == "left"
	{
		if place_empty(x-dist,y, obj_parent_solid)
		{
			x = x - dist;
		}
	}
	else if dir == "right"
	{
		if place_empty(x+dist,y, obj_parent_solid)
		{
			x = x + dist;
		}
	}
}