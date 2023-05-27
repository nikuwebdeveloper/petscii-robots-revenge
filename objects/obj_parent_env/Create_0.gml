canMove = false;
freeMoveUp = false;
freeMoveRight = false;
freeMoveDown = false;
freeMoveLeft = false;
item = "none";
canSearch = "false";
label = false;

if object_index == obj_env_box_brown_normal
{
	canMove = true;
	canSearch = "true";
	mask_index = spr_mask_square_16x16;
}