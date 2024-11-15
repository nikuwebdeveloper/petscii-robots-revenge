function text_outline(xx,yy,text, textColor, outlineColor)
{
	// draw_text_color(xx+1,yy,text,outlineColor,outlineColor,outlineColor,outlineColor,1);
	// draw_text_color(xx,yy+1,text,outlineColor,outlineColor,outlineColor,outlineColor,1);
	// draw_text_color(xx-1,yy,text,outlineColor,outlineColor,outlineColor,outlineColor,1);
	// draw_text_color(xx,yy-1,text,outlineColor,outlineColor,outlineColor,outlineColor,1);
	draw_text_color(xx,yy,text,textColor,textColor,textColor,textColor,1);
}

// slightly differs from the player's code but this might be better
function draw_corner()
{
	if place_meeting(x + 8, y + 0, obj_env_wall)
	{
		var wallRight = instance_place(x + 8, y + 0, obj_env_wall)
		if wallRight != noone
		{
			with wallRight
			{
				if place_meeting(x + 0, y + 8, obj_env_wall) //and place_meeting(x - 0, y - 16, obj_env_wall) // 
				{
					other.drawWallVert = false
				}
				else
				{
					other.drawWallVert = true
				}
			}
			if drawWallVert
			{
				draw_sprite(spr_wall_full_0, 0, wallRight.x -16, wallRight.y - 0)
			}
		}
	}
	else
	{
		drawWallVert = false
	}

	// horizontal walls, down
	if place_meeting(x + 0, y + 8, obj_env_wall)
	{
		
		var wallDown = instance_place(x + 0, y + 8, obj_env_wall)
		if wallDown != noone
		{
			with wallDown
			{
				if place_meeting(x + 16, y, obj_env_wall) //and place_meeting(x - 8, y, obj_env_wall)
				{
					other.drawWallHori = false
				}
				else
				{
					other.drawWallHori = true
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
		drawWallHori = false
	}
}

//function draw_corner_OLD()
//{
//	// // vertical walls
//	draw_text(x,y, "draw_corner()")
//	if place_meeting(x + 8, y + 0, obj_env_wall)
//	{
//		var wallRight = instance_place(x + 8, y + 8, obj_env_wall)
//		// if there is a wall to the right
//		if wallRight != noone
//		{
//			with wallRight
//			{
//				if place_meeting(x + 0, y + 8, obj_env_wall) //and place_meeting(x - 0, y - 16, obj_env_wall) // 
//				{
//					drawWallVert = false
//				}
//				else
//				{
//					drawWallVert = true
//				}
//			}
//			if drawWallVert
//			{
//				draw_sprite(spr_wall_full_0, 0, wallRight.x -16, wallRight.y - 0)
//			}
//		}
//	}
//	else
//	{
//		drawWallVert = false
//	}

//	//// horizontal walls, down
//	if place_meeting(x + 0, y + 8, obj_env_wall)
//	{
//		var wallDown = instance_place(x + 8, y + 8, obj_env_wall)
//		if wallDown != noone
//		{
//			with wallDown
//			{
//				if place_meeting(x + 16, y, obj_env_wall) //and place_meeting(x - 8, y, obj_env_wall)
//				{
//					drawWallHori = false
//				}
//				else
//				{
//					drawWallHori = true
//				}
//			}
//			if drawWallHori
//			{
//				draw_sprite(spr_wall_full_1, 0, wallDown.x - 0, wallDown.y - 16)
//			}
//		}
//	}
//	else
//	{
//		// reset
//		drawWallHori = false
//	}
//}

