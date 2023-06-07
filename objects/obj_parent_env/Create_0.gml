canMove = false;
item = "none";
canSearch = "false";
searched = false;
label = false;
hp = 1;

if object_index == obj_env_box_brown_normal
{
	hp = 10;
	canMove = true;
	canSearch = "true";
	mask_index = spr_mask_square_16x16;
}