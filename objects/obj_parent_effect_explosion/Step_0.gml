if image_index > 3
{
	instance_destroy();
}
if place_meeting(x,y,obj_parent_enemy)
{
	var target = instance_place(x,y,obj_parent_enemy)
	if instance_exists(target)
	{
			target.alertTarget = obj_player_vic;
	}
}
