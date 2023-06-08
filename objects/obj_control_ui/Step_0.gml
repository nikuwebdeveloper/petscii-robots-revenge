//toggle between items
if obj_control_main.gameMode == "gameplay"
{
	//items
	if currentItemPos < 3
	{
		if obj_control_input.input_item_right
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
		if obj_control_input.input_item_left
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
	if currentWeaponPos == 0
	{
		if obj_control_input.input_weapon_right
		{
			weaponArrowFrame = 1;
			currentWeaponPos++;
		}
		else
		{
			weaponArrowFrame = 0;
		}
	}
	if currentWeaponPos == 1
	{
		if obj_control_input.input_weapon_left
		{
			weaponArrowFrame = 1;
			currentWeaponPos--;
		}
		else
		{
			weaponArrowFrame = 0;
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

//radar
if radar
{
	if obj_control_input.input_f9
	{
		radar = false;
	}
	with(obj_player_vic)
	{
		var target = instance_nearest(obj_player_vic.x, obj_player_vic.y, obj_parent_enemy)
		if distance_to_object(target) < room_width
		{
			other.targetDir = point_direction(obj_player_vic.x, obj_player_vic.y, target.x, target.y);
		}
	}
}
else
{
	if obj_control_input.input_f9
	{
		radar = true;
	}
}
