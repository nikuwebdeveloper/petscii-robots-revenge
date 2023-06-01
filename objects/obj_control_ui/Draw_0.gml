draw_sprite(spr_ui_bg,0,x,y);
if obj_control_inventory.weaponPistol
{
	draw_sprite(spr_ui_item_pistol, 0, x + itemXPos, y + 24);
}
else if obj_control_inventory.weaponPlasma
{
	//
}
else
{
	draw_sprite(spr_ui_item_none, 0, x + itemXPos, y + 24);
}

//runs if you have collected any items
var itemSprite = spr_ui_item_none;
if obj_control_inventory.totalItemNum > 0
{
	if currentItemPos > 0
	{
		draw_sprite(spr_ui_item_arrow_left, 0, x + itemXPos - 10, y + 77);
	}
	if currentItemPos < 3
	{
		draw_sprite(spr_ui_item_arrow_right, 0, x + itemXPos + 28, y + 77);
	}
	
	//set current item sprite
	switch (currentItemPos)
	{
		case 0:
			if obj_control_inventory.itemHealthPack
			{
				itemSprite = spr_ui_item_healthPack;
			}
			else
			{
				itemSprite = spr_ui_item_empty;
			}
			break;		
		case 1:
			if obj_control_inventory.itemBomb
			{
				itemSprite = spr_ui_item_bomb;
			}
			else
			{
				itemSprite = spr_ui_item_empty;
			}
			break;			
		case 2:
			if obj_control_inventory.itemMagnet
			{
				itemSprite = spr_ui_item_magnet;
			}
			else
			{
				itemSprite = spr_ui_item_empty;
			}
			break;			
		case 3:
			if obj_control_inventory.itemEmp
			{
				itemSprite = spr_ui_item_emp;
			}
			else
			{
				itemSprite = spr_ui_item_empty;
			}
			break;			
	}
}
draw_sprite(itemSprite, 0, x + itemXPos, y + 77);

//healthbar
var healthbarFrame = ceil(obj_player_vic.hp / 10)
draw_sprite(spr_ui_healthbar,healthbarFrame,x + itemXPos - 6, y + 186)

//draw keys
{
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
draw_sprite(spr_ui_static,frame,x + 423, y + 9);
draw_sprite(spr_ui_static,frame,x + 423, y + 63);
draw_sprite(spr_ui_static,frame,x + 423, y + 117);
draw_sprite(spr_ui_static,frame,x + 423, y + 171);
draw_sprite(spr_ui_static,frame,x + 423, y + 225);
draw_sprite(spr_ui_static,frame,x + 357, y + 225);