event_inherited();

dir = "up";
hp = 1;

if object_index == obj_enemy_hoverbot
{
	var randDir = irandom_range(0,1);
	if randDir == 0
	{
		dir = "up";
	}
	else
	{
		dir = "left";
	}
	hp = 10;
}