event_inherited()

// vertical walls
if place_meeting(x + 8, y + 0, obj_env_wall)
{
	var wallRight = instance_place(x + 8, y + 8, obj_env_wall)
	if wallRight != noone
	{
		with wallRight
		{
			if place_meeting(x + 0, y + 8, obj_env_wall) //and place_meeting(x - 0, y - 16, obj_env_wall) // 
			{
				obj_player_vic.drawWallVert = false
			}
			else
			{
				obj_player_vic.drawWallVert = true
			}
		}
		if obj_player_vic.drawWallVert
		{
			draw_sprite(spr_wall_full_0, 0, wallRight.x - 16, wallRight.y - 0)
		}
	}
}
else
{
	obj_player_vic.drawWallVert = false
}

// horizontal walls, down
if place_meeting(x + 0, y + 8, obj_env_wall)
{
	var wallDown = instance_place(x + 8, y + 8, obj_env_wall)
	if wallDown != noone
	{
		with wallDown
		{
			if place_meeting(x + 16, y, obj_env_wall) //and place_meeting(x - 8, y, obj_env_wall)
			{
				obj_player_vic.drawWallHori = false
			}
			else
			{
				obj_player_vic.drawWallHori = true
			}
		}
		if drawWallHori
		{
			draw_sprite(spr_wall_full_1, 0, wallDown.x - 0, wallDown.y - 16)
		}
	}
}
else
{
	// reset
	obj_player_vic.drawWallHori = false
}

//draw_sprite(spr_mask_square_16x16, 0, x, y)
//draw_text(x, y, hp)
//draw_text(x, y, depth)

