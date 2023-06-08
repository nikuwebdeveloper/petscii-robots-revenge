draw_sprite(spr_ui_bg,0,x,y);
//if obj_control_inventory.weaponPistol
//{
//	draw_sprite(spr_ui_item_pistol, 0, x + itemXPos, y + 20);
//}
//else if obj_control_inventory.weaponPlasma
//{
//	draw_sprite(spr_ui_item_plasma, 0, x + itemXPos, y + 20);
//}
//else
//{
//	draw_sprite(spr_ui_item_none, 0, x + itemXPos, y + 20);
//}
if obj_control_inventory.currentWeapon == "weaponPistol"
{
	//draw ammo
	if currentWeaponPos == 0
	{
		if obj_control_inventory.weaponPistolAmmo <= 9
		{
			func_text_outline(x + itemXPos + 3, y + 35, "0"+string(obj_control_inventory.weaponPistolAmmo), c_lime, c_green)
		}
		else
		{
			func_text_outline(x + itemXPos + 3, y + 35, obj_control_inventory.weaponPistolAmmo, c_lime, c_green)
		}
		func_text_outline(x + itemXPos + 15, y + 35, "/99", c_lime, c_green) // /9
	}
}
else if obj_control_inventory.currentWeapon == "weaponPlasma"
{
	if currentWeaponPos == 1
	{
		//draw ammo
		if obj_control_inventory.weaponPlasmaAmmo <= 9
		{
			func_text_outline(x + itemXPos + 3, y + 35, "0"+string(obj_control_inventory.weaponPlasmaAmmo), c_lime, c_green)
		}
		else
		{
			func_text_outline(x + itemXPos + 3, y + 35, obj_control_inventory.weaponPlasmaAmmo, c_lime, c_green)
		}
		func_text_outline(x + itemXPos + 15, y + 35, "/99", c_lime, c_green) // /9
	}
}


//runs if you have collected any items
var itemSprite = spr_ui_item_none;
var itemNum = 0;

var weaponSprite = spr_ui_item_none;
//draw weapon arrows
if obj_control_inventory.weaponPistol or obj_control_inventory.weaponPlasma
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
		if obj_control_inventory.weaponPistol
		{
			weaponSprite = spr_ui_item_pistol;
			obj_control_inventory.currentWeapon = "weaponPistol";
		}
		else
		{
			weaponSprite = spr_ui_item_empty;
			obj_control_inventory.currentWeapon = "none";
		}
		break;		
	case 1:
		if obj_control_inventory.weaponPlasma
		{
			weaponSprite = spr_ui_item_plasma;
			obj_control_inventory.currentWeapon = "weaponPlasma";
		}
		else
		{
			weaponSprite = spr_ui_item_empty;
			obj_control_inventory.currentWeapon = "none";
		}
		break;		
}
if obj_control_inventory.totalItemNum > 0
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
			if obj_control_inventory.itemHealthPack
			{
				itemSprite = spr_ui_item_healthPack;
				itemNum = obj_control_inventory.itemHealthPackStock;
				obj_control_inventory.currentItem = "itemHealthPack";
			}
			else
			{
				itemSprite = spr_ui_item_empty;
				obj_control_inventory.currentItem = "none";
			}
			break;		
		case 1:
			if obj_control_inventory.itemBomb
			{
				itemSprite = spr_ui_item_bomb;
				itemNum = obj_control_inventory.itemBombStock;
				obj_control_inventory.currentItem = "itemBomb";
			}
			else
			{
				itemSprite = spr_ui_item_empty;
				obj_control_inventory.currentItem = "none";
			}
			break;			
		case 2:
			if obj_control_inventory.itemMagnet
			{
				itemSprite = spr_ui_item_magnet;
				itemNum = obj_control_inventory.itemMagnetStock;
				obj_control_inventory.currentItem = "itemMagnet";
			}
			else
			{
				itemSprite = spr_ui_item_empty;
				obj_control_inventory.currentItem = "none";
			}
			break;			
		case 3:
			if obj_control_inventory.itemEmp
			{
				itemSprite = spr_ui_item_emp;
				itemNum = obj_control_inventory.itemEmpStock;
				obj_control_inventory.currentItem = "itemEmp";
			}
			else
			{
				itemSprite = spr_ui_item_empty;
				obj_control_inventory.currentItem = "none";
			}
			break;			
	}
	//draw 0 before numbers below 10
	if itemNum <= 9
	{
		func_text_outline(x + itemXPos+2, y + 89, "0"+string(itemNum), c_lime, c_green)
	}
	else
	{
		func_text_outline(x + itemXPos+2, y + 89, itemNum, c_lime, c_green)
	}
	if obj_control_inventory.currentItem != "itemHealthPack" 	
	{
		func_text_outline(x + itemXPos+15, y + 89, "/10", c_lime, c_green) //out of 10 if not medkit
	}
	else 
	{
		func_text_outline(x + itemXPos+15, y + 89, "/99", c_lime, c_green) //out of 100 if a medkit
	}
}
draw_sprite(itemSprite, 0, x + itemXPos, y + 74);
draw_sprite(weaponSprite, 0, x + itemXPos, y + weaponPosY);

//healthbar frame calculation
var healthbarFrame = ceil(obj_player_vic.hp / 10)
if obj_player_vic.hp <= 0
{
	healthbarFrame = 0;
}
draw_sprite(spr_ui_healthbar,healthbarFrame,x + itemXPos - 6, y + 186)

//draw keys
if obj_control_inventory.itemSpadeKey
{
	draw_sprite(spr_ui_key_spade, 0, x + 425, y + 132);
}
if obj_control_inventory.itemHeartKey
{
	draw_sprite(spr_ui_key_heart, 0, x + 425+14, y + 132);
}
if obj_control_inventory.itemDiamondKey
{
	draw_sprite(spr_ui_key_diamond, 0, x + 425+28, y + 132);
}

//draw log text
func_text_outline(x+14, y+236, arrayLog[0], c_lime, c_green);
func_text_outline(x+14, y+246, arrayLog[1], c_lime, c_green);
func_text_outline(x+14, y+256, arrayLog[2], c_lime, c_green);

//draw text on right side
func_text_outline(x+363, y+250, obj_control_main.enemyNumHoverbot,c_lime,c_green)
func_text_outline(x+371, y+250, obj_control_main.enemyNumRollerbot,c_lime,c_green)
func_text_outline(x+379, y+250, obj_control_main.enemyNumEvilbot,c_lime,c_green)
func_text_outline(x+387, y+250, obj_control_main.enemyNumMoverbot,c_lime,c_green)
func_text_outline(x+395, y+250, obj_control_main.enemyNumLaserbot,c_lime,c_green)

//draw radar
if radar
{
	if (targetDir >= 0 and targetDir <= 45) or (targetDir <= 360 and targetDir > 315)
	{
		draw_sprite(spr_ui_radar_right, 0, x+435, y+236)
	}
	if (targetDir <= 135 and targetDir > 45)
	{
		draw_sprite(spr_ui_radar_up, 0, x+435, y+236)
	}
	if (targetDir <= 225 and targetDir > 135)
	{
		draw_sprite(spr_ui_radar_left, 0, x+435, y+236)
	}
	if (targetDir <= 315 and targetDir > 225)
	{
		draw_sprite(spr_ui_radar_down, 0, x+435, y+236)
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
draw_sprite(spr_ui_static, frame, x + 423, y + 9);
draw_sprite(spr_ui_static, frame, x + 423, y + 63);
draw_sprite(spr_ui_static, frame, x + 423, y + 117);
draw_sprite(spr_ui_static, frame, x + 423, y + 171);
draw_sprite(spr_ui_static, frame, x + 423, y + 225);
draw_sprite(spr_ui_static, frame, x + 357, y + 225);