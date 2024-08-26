function player_shoot(_direction, _weapon)
{
	var _target = noone
	var _shotFired = false
	// reduce current ammo by 1
	if _weapon == WEAPON.PISTOL
	{
		// sets sprite to pistol's array of directional sprites
		obj_player_vic.sprite_index = obj_player_vic.spriteDir.pistol[obj_player_vic.facing][_direction]
		if obj_inventory.weaponPistolAmmo > 0
		{
			_shotFired = true
			obj_inventory.weaponPistolAmmo--
		}
	}
	else if _weapon == WEAPON.PLASMA
	{
		// sets sprite to pistol's array of directional sprites
		obj_player_vic.sprite_index = obj_player_vic.spriteDir.plasma[_direction]		
		if obj_inventory.weaponPlasmaAmmo > 0
		{
			_shotFired = true
			obj_inventory.weaponPlasmaAmmo--
		}
	}
	//create projectile
	if _shotFired
	{
		if instance_exists(obj_player_vic)
		{
			// spawn projectile
			_target = instance_create_depth(obj_player_vic.x, obj_player_vic.y, obj_player_vic.depth, obj_shot_player_pistol)
			// set facing of projectile
			_target.facing = _direction
		}
	}
}

function beep()
{
	show_message("beep")
}