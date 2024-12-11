event_inherited();
if !broken
{
	if place_meeting(x,y,obj_parent_enemy)
	{
		target = instance_place(x,y,obj_parent_enemy)
		if confuseSwitch
		{
			confuseSwitch = false;
			target.mode = MODE.CONFUSE
		}
	}
}
else
{
	image_index = 1;
	depth = depthInit;
}