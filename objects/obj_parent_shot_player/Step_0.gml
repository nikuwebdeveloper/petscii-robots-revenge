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

if object_index == obj_shot_player_pistol
{
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
}
else if object_index == obj_shot_player_plasma
{
	if dir == "up"
	{
		reachX = 0;
		reachY = -16
	}
	else if dir == "down"
	{
		reachX = 0;
		reachY = 16;
	}
	else if dir == "left"
	{
		reachX = -16;
		reachY = 0;
	}
	else if dir == "right"
	{
		reachX = 16;
		reachY = 0;
	}
}

if object_index == obj_shot_player_pistol
{
	if place_meeting(x+reachX, y+reachY, obj_parent_solid)
	{
		var target = instance_place(x+reachX,y+reachY,obj_parent_solid)
		//var targetEnv = instance_place(x,y,obj_parent_env)
		if instance_exists(target)
		{
			//show_message("");
			//depth = target.depth - 16;
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
	if place_meeting(x+reachX,y+reachY,obj_parent_env) 
	{
		var target = instance_place(x+reachX,y+reachY,obj_parent_env)
		if instance_exists(target)
		{
			if !target.pass //if can't pass
			{
				func_explosion("plasma");
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
					func_explosion("plasma");
					instance_destroy();
				}
			}
		}
	}
}

