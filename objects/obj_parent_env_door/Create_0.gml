locked = false;
open = false;
switchOpen = true;
key = "none";
image_speed = 0;

if object_index == obj_env_door_hori
{
	mask_index = spr_env_door_hori_mask_unlocked;
}
else if object_index == obj_env_door_vert
{
	mask_index = spr_env_door_vert_mask_unlocked;
}