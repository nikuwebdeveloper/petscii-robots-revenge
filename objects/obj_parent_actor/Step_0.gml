if object_index == obj_player_vic
{
	if obj_main.gameMode == GAMEMODE.GAMEPLAY
	{
		if alive
		{
			//x and y distance for player's "reach" in front of them
			if facing == DIR.UP
			{
				yReach = -8
				xReach = 0;
			}
			else if facing == DIR.DOWN
			{
				yReach = 8
				xReach = 0;
			}
			else if facing == DIR.LEFT
			{
				yReach = 0;
				xReach = -8
			}
			else if facing == DIR.RIGHT
			{
				yReach = 0;
				xReach = 8
			}
		}
	}
}