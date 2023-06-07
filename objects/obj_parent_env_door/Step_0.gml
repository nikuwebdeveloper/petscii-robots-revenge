if object_index == obj_env_door_hori
{
	if obj_player_vic.y < y and distance_to_object(obj_player_vic) < 64
	{
		depth = obj_player_vic.y - 1000
	}
}
else if object_index == obj_env_door_vert and distance_to_object(obj_player_vic) < 64
{
	if obj_player_vic.x > x 
	{
		depth = obj_player_vic.y + 16
	}
}

if distance_to_object(obj_player_vic) < 64
{
	open = true;
	if switchOpen
	{
		switchOpen = false;
		image_index = 0;
	}
}
else
{
	open = false;
}

if open
{
	image_speed = 1;
	if image_index >= 4
	{
		image_speed = 0;
	}
}
else if !open
{
	switchOpen = true;
	image_speed = 1;
	if image_index >= 7
	{
		image_speed = 0;
	}
}