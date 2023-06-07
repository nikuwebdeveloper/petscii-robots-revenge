dir = "none";
sp = 16;
dmg = 1;
hspeed = 0;
vspeed = 0;
sprite_index = spr_empty;
reachX = 0;
reachY = 0;
creator = obj_player_vic.id;

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