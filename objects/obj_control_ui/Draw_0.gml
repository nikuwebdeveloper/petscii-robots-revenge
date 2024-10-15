if obj_main.gameMode == GAMEMODE.GAMEPLAY
{
	draw_sprite(spr_ui_bg,0,x,y);
	if obj_inventory.currentWeapon == WEAPON.PISTOL
	{
		//draw ammo
		if currentWeaponPos == 0
		{
			if obj_inventory.weaponPistolAmmo <= 9
			{
				text_outline(x + itemXPos + 3, y + 35, "0"+string(obj_inventory.weaponPistolAmmo), GREEN, GREEN)
			}
			else
			{
				text_outline(x + itemXPos + 3, y + 35, obj_inventory.weaponPistolAmmo, GREEN, GREEN)
			}
			text_outline(x + itemXPos + 15, y + 35, "/99", GREEN, GREEN) // /9
		}
	}
	else if obj_inventory.currentWeapon == WEAPON.PLASMA
	{
		if currentWeaponPos == 1
		{
			//draw ammo
			if obj_inventory.weaponPlasmaAmmo <= 9
			{
				text_outline(x + itemXPos + 3, y + 35, "0"+string(obj_inventory.weaponPlasmaAmmo), GREEN, GREEN)
			}
			else
			{
				text_outline(x + itemXPos + 3, y + 35, obj_inventory.weaponPlasmaAmmo, GREEN, GREEN)
			}
			text_outline(x + itemXPos + 15, y + 35, "/99", GREEN, GREEN) // /9
		}
	}


	//runs if you have collected any items
	var itemSprite = spr_ui_item_none;
	var itemNum = 0;

	var weaponSprite = spr_ui_item_none;
	//draw weapon arrows
	if obj_inventory.hasWeaponPistol or obj_inventory.hasWeaponPlasma
	{
		if currentWeaponPos == 1
		{
			draw_sprite(spr_ui_item_arrow_left, weaponArrowFrame, x + itemXPos - 10, y + weaponPosY);
		}
		if currentWeaponPos == 0
		{
			draw_sprite(spr_ui_item_arrow_right, weaponArrowFrame, x + itemXPos + 28, y + weaponPosY);
		}
	}
	switch (currentWeaponPos)
	{
		case 0:
			if obj_inventory.hasWeaponPistol
			{
				weaponSprite = spr_ui_item_pistol;
				obj_inventory.currentWeapon = WEAPON.PISTOL;
			}
			else
			{
				weaponSprite = spr_ui_item_empty;
				obj_inventory.currentWeapon = WEAPON.UNARMED;
			}
			break;		
		case 1:
			if obj_inventory.hasWeaponPlasma
			{
				weaponSprite = spr_ui_item_plasma;
				obj_inventory.currentWeapon = WEAPON.PLASMA;
			}
			else
			{
				weaponSprite = spr_ui_item_empty;
				obj_inventory.currentWeapon = WEAPON.UNARMED;
			}
			break;		
	}
	if obj_inventory.totalItemNum > 0
	{	
		if currentItemPos > 0
		{
			draw_sprite(spr_ui_item_arrow_left, itemArrowFrameLeft, x + itemXPos - 10, y + 74);
		}
		if currentItemPos < 3
		{
			draw_sprite(spr_ui_item_arrow_right, itemArrowFrameRight, x + itemXPos + 28, y + 74);
		}
	
		//set current item sprite
		switch (currentItemPos)
		{
			case 0:
				if obj_inventory.hasItemMedkit
				{
					itemSprite = spr_ui_item_healthPack;
					itemNum = obj_inventory.itemHealthPackStock;
					obj_inventory.currentItem = "hasItemMedkit";
				}
				else
				{
					itemSprite = spr_ui_item_empty;
					obj_inventory.currentItem = "none";
				}
				break;		
			case 1:
				if obj_inventory.itemBomb
				{
					itemSprite = spr_ui_item_bomb;
					itemNum = obj_inventory.itemBombStock;
					obj_inventory.currentItem = "itemBomb";
				}
				else
				{
					itemSprite = spr_ui_item_empty;
					obj_inventory.currentItem = "none";
				}
				break;			
			case 2:
				if obj_inventory.itemMagnet
				{
					itemSprite = spr_ui_item_magnet;
					itemNum = obj_inventory.itemMagnetStock;
					obj_inventory.currentItem = "itemMagnet";
				}
				else
				{
					itemSprite = spr_ui_item_empty;
					obj_inventory.currentItem = "none";
				}
				break;			
			case 3:
				if obj_inventory.itemEmp
				{
					itemSprite = spr_ui_item_emp;
					itemNum = obj_inventory.itemEmpStock;
					obj_inventory.currentItem = "itemEmp";
				}
				else
				{
					itemSprite = spr_ui_item_empty;
					obj_inventory.currentItem = "none";
				}
				break;			
		}
		//draw 0 before numbers below 10
		if itemNum <= 9
		{
			text_outline(x + itemXPos+2, y + 89, "0"+string(itemNum), GREEN, GREEN)
		}
		else
		{
			text_outline(x + itemXPos+2, y + 89, itemNum, GREEN, GREEN)
		}
		if obj_inventory.currentItem != "hasItemMedkit" 	
		{
			text_outline(x + itemXPos+15, y + 89, "/10", GREEN, GREEN) //out of 10 if not medkit
		}
		else 
		{
			text_outline(x + itemXPos+15, y + 89, "/99", GREEN, GREEN) //out of 100 if a medkit
		}
	}
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
	if obj_inventory.itemSpadeKey
	{
		draw_sprite(spr_ui_key_spade, 0, x + 425, y + 132);
	}
	if obj_inventory.itemHeartKey
	{
		draw_sprite(spr_ui_key_heart, 0, x + 425+14, y + 132);
	}
	if obj_inventory.itemDiamondKey
	{
		draw_sprite(spr_ui_key_diamond, 0, x + 425+28, y + 132);
	}

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