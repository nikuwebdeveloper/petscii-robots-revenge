canMove = false;
item = "none";
canSearch = false;
searched = false;
label = false; //item name for draw
hp = 1;
pass = true; //pass through object
range = 0;// explosion range
boomSwitch = false; //for exploding
on = false;
switchTile = true;
drawCap = false

spriteCardboard = 
{
	downHalfStepCenter : false,
	downFullStepCenter : false,
	downFullStepRight : false
}

event_inherited()
if object_index == obj_env_wall
{
	hp = -1
	pass = false
	placed = true
	tileWallTop = layer_tilemap_get_id(layer_get_name("layer_tile_wallTop"))
	tileWallBottom = layer_tilemap_get_id(layer_get_name("layer_tile_wallBottom"))
	type = "none"
	up = y - 16
	down = y + 16
	left = x - 16
	right = x + 16
	mask_index = spr_hitbox_wall
}
else if object_index == obj_env_autoBridge
{

}
else if object_index == obj_env_switch
{
	mask_index = spr_hitbox_16x16;
	active = false
	targetBridge = noone
	bridgeLength = 0
}
else if object_index == obj_env_plant_tree
{
	var rand = irandom_range(0,1)
	 sprite_index = rand ? spr_env_plant_tree_a :  spr_env_plant_tree_b
}
else if object_index == obj_env_box_brown_normal
{
	hp = 10;
	canMove = true;
	canSearch = true;
	mask_index = spr_hitbox_16x16;
}
else if object_index == obj_env_barrel
{
	hp = 1;
	pass = false;
	canMove = true;
	mask_index = spr_hitbox_16x16;
	boomSwitch = true;
	range = 3;
}
else if object_index == obj_env_plant_potted
{
	hp = 5;
	canMove = true;
	mask_index = spr_hitbox_16x16;
}
else if object_index == obj_env_plant_tree
{
	hp = -1;
	mask_index = spr_hitbox_16x16;
}
else if object_index == obj_env_teleporter_base
{
	mask_index = spr_hitbox_16x16;
}
else if object_index == obj_env_chair_up
or object_index == obj_env_chair_down
or object_index == obj_env_chair_left
or object_index == obj_env_chair_right
{
	hp = 5;
	canMove = true;
	mask_index = spr_hitbox_16x16;
}
else if object_index == obj_env_table_heavy_vert_center
{
	instance_create_depth(x,y - 16,depth,obj_env_table_heavy_vert_top)
	instance_create_depth(x,y + 16,depth,obj_env_table_heavy_vert_bottom)
}
else if object_index == obj_env_table_light_vert_center
{
	instance_create_depth(x,y - 16,depth,obj_env_table_light_vert_top)
	instance_create_depth(x,y + 16,depth,obj_env_table_light_vert_bottom)
}