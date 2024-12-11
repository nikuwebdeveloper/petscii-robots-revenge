itemToGive = ITEM.NONE
weaponToGive = WEAPON.NONE
mask_index = spr_hitbox_14x14

if place_meeting(x,y,obj_parent_env)
{
	var target = instance_place(x,y,obj_parent_env)
	switch object_index
	{
		case obj_mapItem_medkit:
			itemToGive = ITEM.MEDKIT
			break
		case obj_mapItem_bomb:
			itemToGive = ITEM.BOMB
			break
		case obj_mapItem_emp:
			itemToGive = ITEM.EMP
			break;
		case obj_mapItem_magnet:
			itemToGive = ITEM.MAGNET
			break;
		case obj_mapWeapon_pistol:
			weaponToGive = WEAPON.PISTOL
			break;
		default:
			break
	}
	target.item = itemToGive
	target.weapon = weaponToGive
}

instance_destroy()