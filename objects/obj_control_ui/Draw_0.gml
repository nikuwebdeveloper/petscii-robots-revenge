draw_sprite(spr_ui_bg,0,x,y);
if obj_control_inventory.weaponPistol
{
	draw_sprite(spr_ui_item_pistol, 0, x + itemXPos, y + 20);
}
else if obj_control_inventory.weaponPlasma
{
	//
}
else
{
	draw_sprite(spr_ui_item_none, 0, x + itemXPos, y + 20);
}
if obj_control_inventory.currentWeapon == "weaponPistol"
{
	//draw ammo
	func_text_outline(x + itemXPos+12, y + 35, obj_control_inventory.weaponPistolAmmo, c_lime, c_green)
}


//runs if you have collected any items
var itemSprite = spr_ui_item_none;
var itemNum = 0;
if obj_control_inventory.totalItemNum > 0
{	
	if currentItemPos > 0
	{
		draw_sprite(spr_ui_item_arrow_left, 0, x + itemXPos - 10, y + 74);
	}
	if currentItemPos < 3
	{
		draw_sprite(spr_ui_item_arrow_right, 0, x + itemXPos + 28, y + 74);
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
	func_text_outline(x + itemXPos+15, y + 89, itemNum, c_lime, c_green)
}
draw_sprite(itemSprite, 0, x + itemXPos, y + 74);

//healthbar
var healthbarFrame = ceil(obj_player_vic.hp / 10)
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