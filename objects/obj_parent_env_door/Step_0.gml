if !locked
{
	if distance_to_object(obj_player_vic) < 48
	{
		if image_index != image_number - 1
		{
			image_speed = 1
		}
		else
		{
			image_speed = 0
		}
	}
	else
	{
		if image_index != 0
		{
			image_speed = -1
		}
		else
		{
			image_speed = 0
		}
	}
}
else
{
	mask_index = spr_env_door_hori_mask_locked
}