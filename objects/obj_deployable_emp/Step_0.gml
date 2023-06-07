event_inherited();
if image_index >= 5
{
	image_speed = 0;
	if boomSwitch
	{
		boomSwitch = false;
		instance_create_depth(x,y,depth-1,obj_effect_emp);
		image_index = 6;
	}
}