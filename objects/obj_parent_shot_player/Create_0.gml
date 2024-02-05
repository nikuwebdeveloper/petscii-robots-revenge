dir = "none";
sp = 16;
dmg = 1;
hspeed = 0;
vspeed = 0;
reachX = 0;
reachY = 0;
creator = obj_player_vic.id;
range = 3;

if object_index == obj_shot_player_pistol
{
	if dir == "up"
	{
		sprite_index = spr_shot_player_pistol_up;
	}
	else if dir == "down"
	{
		sprite_index = spr_shot_player_pistol_down;
	}
	else if dir == "left"
	{
		sprite_index = spr_shot_player_pistol_left;
	}
	else if dir == "right"
	{
		sprite_index = spr_shot_player_pistol_right;
	}
}
else if object_index == obj_shot_player_plasma
{
	sprite_index = spr_shot_player_plasma;
	//if dir == "up"
	//{
	//	sprite_index = spr_shot_player_pistol_up;
	//}
	//else if dir == "down"
	//{
	//	sprite_index = spr_shot_player_pistol_down;
	//}
	//else if dir == "left"
	//{
	//	sprite_index = spr_shot_player_pistol_left;
	//}
	//else if dir == "right"
	//{
	//	sprite_index = spr_shot_player_pistol_right;
	//}
}