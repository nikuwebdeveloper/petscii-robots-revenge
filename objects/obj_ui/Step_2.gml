depth = -9999

////follow player
if instance_exists(obj_player_vic)
{
	x = obj_player_vic.x - obj_main.viewCenterX;
	y = obj_player_vic.y - obj_main.viewCenterY;
}