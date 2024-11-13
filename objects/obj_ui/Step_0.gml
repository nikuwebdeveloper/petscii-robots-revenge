//toggle between items
if obj_main.gameMode == GAMEMODE.GAMEPLAY
{
	//items
	if currentItemPos < 3
	{
		if global.input.item_right
		{
			itemArrowFrameRight = 1;
			currentItemPos++;
		}
		else
		{
			itemArrowFrameRight = 0;
		}
	}
	if currentItemPos > 0
	{
		if global.input.item_left
		{
			itemArrowFrameLeft = 1;
			currentItemPos--;
		}
		else
		{
			itemArrowFrameLeft = 0;
		}
	}
	//weapons
	// auto switch on acquisition
	// only pistol
	if global.armory.pistol.acquired and !global.armory.plasma.acquired
	{
		currentWeaponPos = 0
	}
	// only plasma
	else if !global.armory.pistol.acquired and global.armory.plasma.acquired
	{
		currentWeaponPos = 1

	}
	// has both weapons
	else if global.armory.pistol.acquired and global.armory.plasma.acquired
	{
		if global.input.weapon_right and currentWeaponPos < 1
		{
			currentWeaponPos++
		}
		if global.input.weapon_left and currentWeaponPos > 0
		{
			currentWeaponPos--
		}
	}
}

//log
if newLine != ""
{
	arrayLog[0] = arrayLog[1];
	arrayLog[1] = arrayLog[2];
	arrayLog[2] = newLine;
	newLine = "";
}
if instance_exists(obj_player_vic)
{
	if obj_player_vic.hp <= 15
	{
		if switchWarning
		{
			switchWarning = false;
			newLine = "WARNING! USER DEATH IMMINENT!"
		}
	}
	else
	{
		switchWarning = true;
	}
}
//radar
if radar
{
	if global.input.f9
	{
		radar = false;
	}
	if instance_exists(obj_player_vic)
	{
		with(obj_player_vic)
		{
			var target = instance_nearest(obj_player_vic.x, obj_player_vic.y, obj_parent_enemy)
			if distance_to_object(target) < room_width
			{
				other.targetDir = point_direction(obj_player_vic.x, obj_player_vic.y, target.x, target.y);
			}
		}
	}
}
else
{
	if global.input.f9
	{
		radar = true;
	}
}

