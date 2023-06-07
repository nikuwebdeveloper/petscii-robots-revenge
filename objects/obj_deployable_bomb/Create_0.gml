timer = 0;
maxTimer = 60*3;
range = 3;
moveSwitch = true;
var rand = irandom_range(0,3);

if place_meeting(x,y,obj_env_wall)
{
	if instance_exists(obj_player_vic)
	{
		x = obj_player_vic.x;
		y = obj_player_vic.y;
	}
}
if place_meeting(x,y,obj_deployable_bomb)
{
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