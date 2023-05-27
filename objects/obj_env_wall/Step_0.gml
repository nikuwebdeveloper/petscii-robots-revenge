event_inherited();

if place_empty(x,y+16,obj_env_wall) //no down
and place_empty(x-16,y,obj_env_wall) //no left
and place_empty(x+16,y,obj_env_wall) //no right
and place_meeting(x,y-16,obj_env_wall) //yes up
{
	capBottom = true;
}