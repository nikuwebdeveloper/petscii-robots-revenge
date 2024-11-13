if obj_main.gameMode == GAMEMODE.GAMEPLAY
{
	draw_sprite(spr_ui_bg,0,x,y);
	
	// draw numbers
	if global.currentWeapon== WEAPON.PISTOL
	{
		if global.armory.pistol.stock<= 9
		{
			text_outline(x + itemXPos + 3, y + 35, "0"+string(global.armory.pistol.stock), GREEN, GREEN)
		}
		else
		{
			text_outline(x + itemXPos + 3, y + 35, global.armory.pistol.stock, GREEN, GREEN)
		}
		text_outline(x + itemXPos + 15, y + 35, $"/{global.armory.pistol.limit}",GREEN, GREEN) // /9
	}
	else if global.currentWeapon== WEAPON.PLASMA
	{
		if global.armory.plasma.stock <= 9
		{
			text_outline(x + itemXPos + 3, y + 35, "0"+string(global.armory.plasma.stock) , GREEN, GREEN)
		}
		else
		{
			text_outline(x + itemXPos + 3, y + 35, global.armory.plasma.stock,  GREEN, GREEN)
		}
		text_outline(x + itemXPos + 15, y + 35, $"/{global.armory.plasma.limit}", GREEN, GREEN) // /9
	}

	//runs if you have collected any items
	var itemSprite = spr_ui_item_none;
	var itemNum = 0;

	var weaponSprite = spr_ui_item_none;
	//draw weapon arrows
	if global.armory.pistol.acquired or global.armory.plasma.acquired
	{
		if currentWeaponPos == 1
		{
			draw_sprite(spr_ui_item_arrow_left_off, weaponArrowFrame, x + itemXPos - 10, y + weaponPosY);
		}
		if currentWeaponPos == 0
		{
			draw_sprite(spr_ui_item_arrow_right_off, weaponArrowFrame, x + itemXPos + 28, y + weaponPosY);
		}
		//if global.armory.plasma.acquired
		//{

		//}
	}
	switch (currentWeaponPos)
	{
		case 0:
			if global.armory.pistol.acquired
			{
				weaponSprite = global.armory.pistol.sprite.ui
				global.currentWeapon= WEAPON.PISTOL;
			}
			else
			{
				weaponSprite = spr_ui_item_empty;
				global.currentWeapon= WEAPON.UNARMED;
			}
			break;		
		case 1:
			if global.armory.plasma.acquired
			{
				weaponSprite = global.armory.plasma.sprite.ui
				global.currentWeapon= WEAPON.PLASMA;
			}
			else
			{
				weaponSprite = spr_ui_item_empty;
				global.currentWeapon= WEAPON.UNARMED;
			}
			break;		
	}
	if currentItemPos > 0
	{
		draw_sprite(spr_ui_item_arrow_left_on, itemArrowFrameLeft, x + itemXPos - 10, y + 74);
	}
	if currentItemPos < 3
	{
		draw_sprite(spr_ui_item_arrow_right_on, itemArrowFrameRight, x + itemXPos + 28, y + 74);
	}
	
	//set current item sprite
	switch (currentItemPos)
	{
		case 0:
			if global.inventory.medkit.acquired
			{
				itemSprite =global.inventory.medkit.sprite.ui
				itemNum = global.inventory.medkit.stock;
				global.currentItem = ITEM.MEDKIT;
			}
			else
			{
				itemSprite = spr_ui_item_empty;
				global.currentItem = ITEM.NONE;
			}
			break;		
		case 1:
			if global.inventory.bomb.acquired
			{
				itemSprite =global.inventory.bomb.sprite.ui
				itemNum = global.inventory.bomb.stock;
				global.currentItem = ITEM.BOMB;
			}
			else
			{
				itemSprite = spr_ui_item_empty;
				global.currentItem = ITEM.NONE;
			}
			break;			
		case 2:
			if global.inventory.magnet.acquired
			{
				itemSprite =global.inventory.magnet.sprite.ui
				itemNum = global.inventory.magnet.stock;
				global.currentItem = ITEM.MAGNET;
			}
			else
			{
				itemSprite = spr_ui_item_empty;
				global.currentItem = ITEM.NONE;
			}
			break;			
		case 3:
			if global.inventory.emp.acquired
			{
				itemSprite = global.inventory.emp.sprite.ui
				itemNum = global.inventory.emp.stock;
				global.currentItem = ITEM.EMP;
			}
			else
			{
				itemSprite = spr_ui_item_empty;
				global.currentItem = ITEM.NONE;
			}
			break;			
	}
	// draw single or double digit numbers
	if (itemNum < 10)
	{
		text_outline(x + 2 + itemXPos, y + 89, $"0{itemNum}", GREEN, GREEN)
	}
	else
	{
		text_outline(x + 2 + itemXPos, y + 89,  itemNum, GREEN, GREEN)
	}
	var currentItemMax = 0
	switch (global.currentItem)
	{
		case ITEM.MEDKIT:
			currentItemMax = global.inventory.medkit.limit;
			break;
		case ITEM.MAGNET:
			currentItemMax = global.inventory.magnet.limit;
			break;
		case ITEM.EMP:
			currentItemMax = global.inventory.emp.limit;
			break;
		case ITEM.BOMB:
			currentItemMax = global.inventory.bomb.limit;
			break;
	}
	text_outline(x + itemXPos+15, y + 89, $"/{currentItemMax}", GREEN, GREEN)
	
	draw_sprite(itemSprite, 0, x + itemXPos, y + 74);
	draw_sprite(weaponSprite, 0, x + itemXPos, y + weaponPosY);

	//healthbar frame calculation
	if instance_exists(obj_player_vic)
	{
		var healthbarFrame = ceil(obj_player_vic.hp / 10)
		if obj_player_vic.hp <= 0
		{
			healthbarFrame = 0;
		}
		draw_sprite(spr_ui_healthbar,healthbarFrame,x + itemXPos - 6, y + 186)
	}

	//draw keys
	//if obj_inventory.itemSpadeKey
	//{
	//	draw_sprite(spr_ui_key_spade, 0, x + 425, y + 132);
	//}
	//if obj_inventory.itemHeartKey
	//{
	//	draw_sprite(spr_ui_key_heart, 0, x + 425+14, y + 132);
	//}
	//if obj_inventory.itemDiamondKey
	//{
	//	draw_sprite(spr_ui_key_diamond, 0, x + 425+28, y + 132);
	//}

	//draw log text
	text_outline(x + 14, y + 236, arrayLog[0], GREEN, GREEN);
	text_outline(x + 14, y + 246, arrayLog[1], GREEN, GREEN);
	text_outline(x + 14, y + 256, arrayLog[2], GREEN, GREEN);

	//draw text on right side
	text_outline(x + 363, y + 250, obj_main.enemyCount.hoverbot,GREEN,GREEN)
	text_outline(x + 371, y + 250, obj_main.enemyCount.rollerbot,GREEN,GREEN)
	text_outline(x + 379, y + 250, obj_main.enemyCount.evilbot,GREEN,GREEN)
	text_outline(x + 387, y + 250, obj_main.enemyCount.moverbot,GREEN,GREEN)
	text_outline(x + 395, y + 250, obj_main.enemyCount.laserbot,GREEN,GREEN)

	//draw radar
	if radar
	{
		if (targetDir >= 0 and targetDir <= 45) or (targetDir <= 360 and targetDir > 315)
		{
			draw_sprite(spr_ui_radar_right, 0, x + 435, y + 236)
		}
		if (targetDir <= 135 and targetDir > 45)
		{
			draw_sprite(spr_ui_radar_up, 0, x + 435, y + 236)
		}
		if (targetDir <= 225 and targetDir > 135)
		{
			draw_sprite(spr_ui_radar_left, 0, x + 435, y + 236)
		}
		if (targetDir <= 315 and targetDir > 225)
		{
			draw_sprite(spr_ui_radar_down, 0, x + 435, y + 236)
		}
	}
	else
	{
		draw_sprite(spr_ui_radar_off, 0, x+435, y+236)
	}


	//draw static in tvs
	if frameTimer >= 5
	{
		frame++;
		frameTimer = 0;
	}
	else
	{
		frameTimer++;
	}
	// draw EMP static effect on screens
	if instance_exists(obj_effect_emp)
	{
		draw_sprite(spr_ui_static, frame, x + 423, y + 9);
		draw_sprite(spr_ui_static, frame, x + 423, y + 63);
		draw_sprite(spr_ui_static, frame, x + 423, y + 117);
		draw_sprite(spr_ui_static, frame, x + 423, y + 171);
		draw_sprite(spr_ui_static, frame, x + 423, y + 225);
		draw_sprite(spr_ui_static, frame, x + 357, y + 225);
	}
}
else if obj_main.gameMode == GAMEMODE.STATUS
{
	draw_set_font(font_vcr_20)
	if obj_main.levelClear == "clear"
	{
			text_outline(258-128, 60-16,"MISSION SUCCESSFUL" , GREEN,GREEN);
	}
	else if obj_main.levelClear == "fail"
	{
			text_outline(258-128+24, 60-16,"MISSION FAILED", GREEN,GREEN);
	}
	text_outline(258, 76+32*0, obj_main.levelName, GREEN,GREEN);
	text_outline(258, 76+32*1, obj_main.gameTime, GREEN,GREEN);
	text_outline(258, 76+32*2, obj_main.enemyCount.total, GREEN,GREEN);
	text_outline(258, 76+32*3, obj_main.secrectNum, GREEN,GREEN);
	text_outline(258, 76+32*4, obj_main.difficulty, GREEN,GREEN);
	text_outline(258-128-8, 76+32*5, "PRESS F1 TO RESTART", GREEN,GREEN);
}

if !obj_main.cameraCorrect
{
	draw_rectangle_color(obj_main.cameraX, obj_main.cameraY, obj_main.cameraX + 480, obj_main.cameraY + 270, c_black,c_black,c_black,c_black, false)
}