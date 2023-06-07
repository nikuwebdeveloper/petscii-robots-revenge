if dir == "up"
{
	vspeed = -sp;
	hspeed = 0;
}
else if dir == "down"
{
	vspeed = sp;
	hspeed = 0;
}
else if dir == "left"
{
	vspeed = 0;
	hspeed = -sp;
}
else if dir == "right"
{
	vspeed = 0;
	hspeed = sp;
}

if dir == "up"
{
	sprite_index = spr_shot_player_pistol_up;
	reachX = 0;
	reachY = -16
}
else if dir == "down"
{
	sprite_index = spr_shot_player_pistol_down;
	reachX = 0;
	reachY = 16;
}
else if dir == "left"
{
	sprite_index = spr_shot_player_pistol_left;
	reachX = -16;
	reachY = 0;
}
else if dir == "right"
{
	sprite_index = spr_shot_player_pistol_right;
	reachX = 16;
	reachY = 0;
}

if place_meeting(x, y, obj_parent_solid)
{
	var target = instance_place(x,y,obj_parent_enemy)
	if instance_exists(target)
	{
		target.alertTarget = creator;
		target.hp = target.hp - dmg;
		if !target.pass //if can't pass
		{
			instance_destroy();
			instance_create_depth(x,y,depth,obj_effect_explosion)
		}
	}
	else
	{
		instance_destroy();
		instance_create_depth(x,y,depth,obj_effect_explosion)
	}
}