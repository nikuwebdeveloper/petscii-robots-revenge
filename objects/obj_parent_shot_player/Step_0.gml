// set sprites
if object_index == obj_shot_player_pistol
{
	if facing == DIR.UP
	{
		sprite_index = spr_shot_player_pistol_up;
	}
	else if facing == DIR.DOWN
	{
		sprite_index = spr_shot_player_pistol_down;
	}
	else if facing == DIR.LEFT
	{
		sprite_index = spr_shot_player_pistol_left;
	}
	else if facing == DIR.RIGHT
	{
		sprite_index = spr_shot_player_pistol_right;
	}
}
else if object_index == obj_shot_player_plasma
{
	sprite_index = spr_shot_player_plasma;
}

// set speed
if facing == DIR.UP
{
	vspeed = -sp;
	hspeed = 0;
	xReach = 0;
	yReach = -16
}
else if facing == DIR.DOWN
{
	vspeed = sp;
	hspeed = 0;
	xReach = 0;
	yReach = 16;
}
else if facing == DIR.LEFT
{
	vspeed = 0;
	hspeed = -sp;
	xReach = -16;
	yReach = 0;
}
else if facing == DIR.RIGHT
{
	vspeed = 0;
	hspeed = sp;
	xReach = 16;
	yReach = 0;
}

if object_index == obj_shot_player_pistol
{
	if place_meeting(x+xReach, y+yReach, obj_parent_solid)
	{
		var target = instance_place(x + xReach, y + yReach,obj_parent_solid)
		if !place_meeting(x,y, obj_player_vic){
		//var targetEnv = instance_place(x,y,obj_parent_env)
		if instance_exists(target)
		{
			target.alertTarget = creator;
			target.hp = target.hp - dmg;
			if !target.pass //if can't pass
			{
				instance_destroy();
				if instance_exists(target)
				{
					instance_create_depth(x,y,depth,obj_effect_explosion)
				}
			}
		}
		}
	}
	//if place_meeting(x, y, obj_parent_solid) or place_meeting(x+reachX, y+reachY, obj_parent_enemy)
	//{
	//	var target = instance_place(x,y,obj_parent_enemy)
	//	var targetEnv = instance_place(x,y,obj_parent_env)
	//	if instance_exists(target)
	//	{
	//		depth = target.depth -16;
	//		target.alertTarget = creator;
	//		target.hp = target.hp - dmg;
	//		if !target.pass //if can't pass
	//		{
	//			instance_destroy();
	//			if instance_exists(target){
	//			instance_create_depth(x,y,depth,obj_effect_explosion)}
	//		}
	//	}
	//	if instance_exists(targetEnv)
	//	{
	//		depth = targetEnv.depth -16;
	//		if !targetEnv.pass //if can't pass
	//		{
				
	//			targetEnv.hp = targetEnv.hp - dmg;
	//			instance_destroy();
	//			instance_create_depth(x,y,depth,obj_effect_explosion)
	//		}
	//	}
	//}
}
else if object_index == obj_shot_player_plasma
{
	if place_meeting(x+xReach,y+yReach,obj_parent_env) 
	{
		var target = instance_place(x+xReach,y+yReach,obj_parent_env)
		if instance_exists(target)
		{
			if !target.pass //if can't pass
			{
				explosion("plasma");
				instance_destroy();
			}
		}
	}
	else if place_meeting(x,y,obj_parent_actor)
	{
		if place_meeting(x,y,obj_parent_actor) 
		{
			var target = instance_place(x,y,obj_parent_actor)
			if instance_exists(target)
			{
				if !target.pass //if can't pass
				{
					explosion("plasma");
					instance_destroy();
				}
			}
		}
	}
}

