canMove = false;
item = "none";
canSearch = false;
searched = false;
label = false; //item name for draw
hp = 1;
pass = true; //pass through object
range = 3;// explosion range
boomSwitch = true; //for exploding

if object_index == obj_env_box_brown_normal
{
	hp = 10;
	canMove = true;
	canSearch = true;
	mask_index = spr_mask_square_16x16;
}
else if object_index == obj_env_barrel
{
	hp = 1;
	canMove = true;
	canSearch = false;
	mask_index = spr_mask_square_16x16;
}