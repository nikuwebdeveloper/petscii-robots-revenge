// shifts anything up/right/up-right if they are off the grid
if object_index != obj_env_wall
{
	if y % 16 == 0
	{
		y -= 8
	}
	if x % 16 == 0
	{
		x += 8
	}
}