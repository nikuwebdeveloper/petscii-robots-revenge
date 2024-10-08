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
	}
	target.item = itemToGive
}

instance_destroy()