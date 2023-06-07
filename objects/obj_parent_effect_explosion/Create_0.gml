dmg = 0;
mask_index = spr_mask_square_16x16
if object_index == obj_effect_explosion_damage
{
	dmg = 25;
	if place_meeting(x,y,obj_parent_solid)
	{
		var targetActor = instance_place(x,y,obj_parent_actor);
		var targetEnv = instance_place(x,y,obj_parent_env);
		if instance_exists(targetActor)
		{
			targetActor.hp = targetActor.hp - dmg;
		}
		else if instance_exists(targetEnv)
		{
			targetEnv.hp = targetEnv.hp - dmg;
		}
	}
}
