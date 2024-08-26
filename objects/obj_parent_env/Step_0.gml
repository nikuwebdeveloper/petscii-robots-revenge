if canSearch
{
	if searched
	{
		image_index = 1;
	}
	if hp <= 0
	{
		image_index = 2;
	}
}
if object_index == obj_env_barrel
{
	if hp <= 0
	{
		if boomSwitch
		{
			boomSwitch = false;
			image_index = 1;
			explosion("bomb");
		}
	}
}
else if object_index == obj_env_switch
{
	if active
	{
		targetBridge.active = true
		targetBridge.maxBridgeLength = maxBridgeLength
		image_index = 0
	}
	else
	{
		image_index = 1
	}
}
else if object_index == obj_env_teleporter_base
{
	if obj_main.levelClear == "clear"
	{
		on = true;
	}
	if on
	{
		sprite_index = spr_env_teleporter_base_on;
	}
	else
	{
		sprite_index = spr_env_teleporter_base_off;
	}
}
else if object_index == obj_env_wall
{
	if switchTile
	{
		switchTile = false;
		///---
		if !place_meeting(x,up,obj_env_wall) and !place_meeting(x,down,obj_env_wall) 
		and place_meeting(left,y,obj_env_wall) and place_meeting(right,y,obj_env_wall)
		{
			//if !place_meeting(x,up,obj_env_wall)// and !place_meeting(right,y,obj_env_wall)
			////and !place_meeting(x,down,obj_env_wall)
			//{
			//	//tilemap_set_at_pixel(tileWallTop, 2, x, up);
			//}	
			
			tilemap_set_at_pixel(tileWallBottom, 13, x, y);
			//tilemap_set_at_pixel(tileWallBottom, 13, left, y);
			tilemap_set_at_pixel(tileWallTop, 2, left, up);

		}
		//o--
		else if !place_meeting(x,up,obj_env_wall) and !place_meeting(x,down,obj_env_wall) 
		and !place_meeting(left,y,obj_env_wall) and place_meeting(right,y,obj_env_wall)
		{
			tilemap_set_at_pixel(tileWallBottom, 13, x, y);
			tilemap_set_at_pixel(tileWallBottom, 41, left, y);
			tilemap_set_at_pixel(tileWallTop, 51, left, up);
			tilemap_set_at_pixel(tileWallTop, 2, x, up);
		}	
		//--o
		else if !place_meeting(x,up,obj_env_wall) and !place_meeting(x,down,obj_env_wall) 
		and place_meeting(left,y,obj_env_wall) and !place_meeting(right,y,obj_env_wall)
		{
			tilemap_set_at_pixel(tileWallBottom, 45, x, y);
			tilemap_set_at_pixel(tileWallBottom, 13, left, y);
			tilemap_set_at_pixel(tileWallTop, 52, left, up);
			tilemap_set_at_pixel(tileWallBottom, 5, x, up);
		}	
		// |
		else if place_meeting(x,up,obj_env_wall) and place_meeting(x,down,obj_env_wall) 
		and !place_meeting(left,y,obj_env_wall) and !place_meeting(right,y,obj_env_wall)
		{
			tilemap_set_at_pixel(tileWallBottom, 22, x, y);
			if !place_meeting(x,down, obj_env_wall)
			{
				tilemap_set_at_pixel(tileWallTop, 11, left, y)
			}

			tilemap_set_at_pixel(tileWallTop, 11, left, up);
			//tilemap_set_at_pixel(tileWallBottom, 5, x, up);
		}	
		// i
		else if !place_meeting(x,up,obj_env_wall) and place_meeting(x,down,obj_env_wall) 
		and !place_meeting(left,y,obj_env_wall) and !place_meeting(right,y,obj_env_wall)
		{
			tilemap_set_at_pixel(tileWallBottom, 22, x, y);
			tilemap_set_at_pixel(tileWallTop, 11, left, y);
			tilemap_set_at_pixel(tileWallTop, 61, left, up);
			tilemap_set_at_pixel(tileWallBottom, 5, x, up);
		}	
		// !
		else if place_meeting(x,up,obj_env_wall) and !place_meeting(x,down,obj_env_wall) 
		and !place_meeting(left,y,obj_env_wall) and !place_meeting(right,y,obj_env_wall)
		{
			tilemap_set_at_pixel(tileWallBottom, 45, x, y);
			tilemap_set_at_pixel(tileWallBottom, 41, left, y);
			tilemap_set_at_pixel(tileWallTop, 71, left, up);
			//tilemap_set_at_pixel(tileWallTop, 5, x, up);
		}	
		// L
		else if place_meeting(x,up,obj_env_wall) and !place_meeting(x,down,obj_env_wall) 
		and !place_meeting(left,y,obj_env_wall) and place_meeting(right,y,obj_env_wall)
		{
			tilemap_set_at_pixel(tileWallBottom, 13, x, y);
			tilemap_set_at_pixel(tileWallBottom, 41, left, y);
			tilemap_set_at_pixel(tileWallTop, 31, left, up);
			tilemap_set_at_pixel(tileWallTop, 2, x, up);
		}	
		// _|
		if place_meeting(x,up,obj_env_wall) and !place_meeting(x,down,obj_env_wall) 
		and place_meeting(left,y,obj_env_wall) and !place_meeting(right,y,obj_env_wall)
		{
			tilemap_set_at_pixel(tileWallBottom, 45, x, y);
			//tilemap_set_at_pixel(tileWallTop,13, left, y);
			//tilemap_set_at_pixel(tileWallTop, 22, x, up);
			tilemap_set_at_pixel(tileWallTop, 34, left, up);
		}	
		// 7
		if !place_meeting(x,up,obj_env_wall) and place_meeting(x,down,obj_env_wall) 
		and place_meeting(left,y,obj_env_wall) and !place_meeting(right,y,obj_env_wall)
		{
			tilemap_set_at_pixel(tileWallBottom, 22, x, y);
			tilemap_set_at_pixel(tileWallTop, 11, left, y);
			tilemap_set_at_pixel(tileWallBottom, 5, x, up);
			tilemap_set_at_pixel(tileWallTop, 4, left, up);
		}	
		// |_
		if !place_meeting(x,up,obj_env_wall) and place_meeting(x,down,obj_env_wall) 
		and!place_meeting(left,y,obj_env_wall) and place_meeting(right,y,obj_env_wall)
		{
			tilemap_set_at_pixel(tileWallBottom, 12, x, y);
			tilemap_set_at_pixel(tileWallTop, 11, left, y);
			tilemap_set_at_pixel(tileWallTop, 2, x, up);
			tilemap_set_at_pixel(tileWallTop, 1, left, up);
		}	
		//+
		if place_meeting(x,up,obj_env_wall) and place_meeting(x,down,obj_env_wall) 
		and place_meeting(left,y,obj_env_wall) and place_meeting(right,y,obj_env_wall)
		{
			tilemap_set_at_pixel(tileWallBottom, 12, x, y);
			//tilemap_set_at_pixel(tileWallTop, 11, left, y);
			//tilemap_set_at_pixel(tileWallTop, 2, x, up);
			tilemap_set_at_pixel(tileWallTop, 28, left, up);
		}	
		// o
		if !place_meeting(x,up,obj_env_wall) and !place_meeting(x,down,obj_env_wall) 
		and !place_meeting(left,y,obj_env_wall) and !place_meeting(right,y,obj_env_wall)
		{
			tilemap_set_at_pixel(tileWallBottom, 45, x, y);
			tilemap_set_at_pixel(tileWallBottom, 41, left, y);
			tilemap_set_at_pixel(tileWallTop, 29, left, up);
			tilemap_set_at_pixel(tileWallBottom, 5, x, up);
		}
		//triangle up
		if place_meeting(x,up,obj_env_wall) and !place_meeting(x,down,obj_env_wall) 
		and place_meeting(left,y,obj_env_wall) and place_meeting(right,y,obj_env_wall)
		{
			tilemap_set_at_pixel(tileWallBottom, 13, x, y);
			tilemap_set_at_pixel(tileWallBottom, 41, left, y);
			tilemap_set_at_pixel(tileWallTop, 27, left, up);
			tilemap_set_at_pixel(tileWallTop, 2, x, up);
		}
		//triangle right
		if place_meeting(x,up,obj_env_wall) and place_meeting(x,down,obj_env_wall) 
		and !place_meeting(left,y,obj_env_wall) and place_meeting(right,y,obj_env_wall)
		{
			tilemap_set_at_pixel(tileWallBottom, 12, x, y);
			//tilemap_set_at_pixel(tileWallBottom, 11, left, y);
			tilemap_set_at_pixel(tileWallTop, 17, left, up);
			//tilemap_set_at_pixel(tileWallTop, 2, x, up);
		}
		//triangle down
		if !place_meeting(x,up,obj_env_wall) and place_meeting(x,down,obj_env_wall) 
		and place_meeting(left,y,obj_env_wall) and place_meeting(right,y,obj_env_wall)
		{
			tilemap_set_at_pixel(tileWallBottom, 12, x, y);
			tilemap_set_at_pixel(tileWallBottom, 41, left, y);
			tilemap_set_at_pixel(tileWallTop, 18, left, up);
			tilemap_set_at_pixel(tileWallTop, 2, x, up);
		}
		//triangle left
		if place_meeting(x,up,obj_env_wall) and place_meeting(x,down,obj_env_wall) 
		and place_meeting(left,y,obj_env_wall) and !place_meeting(right,y,obj_env_wall)
		{
			tilemap_set_at_pixel(tileWallBottom, 22, x, y);
			//tilemap_set_at_pixel(tileWallBottom, 11, left, y);
			tilemap_set_at_pixel(tileWallTop, 19, left, up);
			//tilemap_set_at_pixel(tileWallTop, 2, x, up);
		}
	}
}