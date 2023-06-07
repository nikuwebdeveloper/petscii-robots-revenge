function scr_deploy_shift()
{
	if place_meeting(x,y,obj_parent_deployable)
	{
		var target = instance_place(x,y,obj_parent_deployable)
		if target.object_index == object_index
		{
			var rand = irandom_range(0,3);
			if rand == 0
			{
				y = y + 16;
			}
			else if rand == 1
			{
				x = x + 16;
			}
			else if rand == 2
			{
				y = y - 16;
			}
			else if rand == 3
			{
				x = x - 16;
			}	
		}
	}
}
