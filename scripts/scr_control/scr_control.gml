function player_shoot(_direction, _weapon)
{
	var _target = noone
	var _shotFired = false
	// reduce current ammo by 1
	if _weapon == WEAPON.PISTOL
	{
		// sets sprite to pistol's array of directional sprites
		obj_player_vic.sprite_index = obj_player_vic.spriteDir.pistol[obj_player_vic.facing][_direction]
		if global.armory.pistol.stock > 0
		{
			_shotFired = true
			global.armory.pistol.stock--;
		}
	}
	else if _weapon == WEAPON.PLASMA
	{
		// sets sprite to pistol's array of directional sprites
		obj_player_vic.sprite_index = obj_player_vic.spriteDir.plasma[obj_player_vic.facing][_direction]
		if global.armory.plasma.stock > 0
		{
			_shotFired = true
			global.armory.plasma.stock--
		}
	}
	//create projectile
	if _shotFired
	{
		if instance_exists(obj_player_vic)
		{
			obj_player_vic.shootTurnTimer = shootTurnTimerMax
			var xOffset = 0
			var yOffset = 0
			switch _direction
			{
				case DIR.UP:
					xOffset = 0
					yOffset = -4
					break
				case DIR.RIGHT:
					xOffset = 4
					yOffset = 0
					break
				case DIR.DOWN:
					xOffset = 0
					yOffset = 4
					break
				case DIR.LEFT:
					xOffset = -4
					yOffset = 0
					break
			}
			// spawn projectile
			if _weapon == WEAPON.PISTOL
			{
				_target = instance_create_depth(obj_player_vic.x + xOffset, obj_player_vic.y + yOffset, obj_player_vic.depth, obj_shot_player_pistol)
			}
			if _weapon == WEAPON.PLASMA
			{
				_target = instance_create_depth(obj_player_vic.x + xOffset, obj_player_vic.y + yOffset, obj_player_vic.depth, obj_shot_player_plasma)
			}
			// set facing of projectile
			_target.facing = _direction
		}
	}
}

function beep()
{
	show_message("beep")
}

function scr_deploy_shift()
{
	if place_meeting(x,y,obj_parent_deployable)
	{
		var target = instance_place(x,y,obj_parent_deployable)
		if target.object_index == object_index
		{
			var rand = irandom_range(0,3);
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
	}
}
