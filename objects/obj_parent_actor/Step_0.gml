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
	}
}
