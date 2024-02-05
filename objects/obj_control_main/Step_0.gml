if !switchLayerRead
{
	switchLayerRead = true;
	//layers
	topLayer =  layer_get_id("tile_wall_top");
	middleWallLayer =  layer_get_id("tile_wall_bottom");
	sandLayer =  layer_get_id("layer_sand");
	sandBridgeLayer =  layer_get_id("layer_sand_bridge");
	
	middleLayer = layer_get_id("tile_middle");
	//tilemap ids
	tileIdGrass = layer_tilemap_get_id(middleLayer);
	tileIdSand = layer_tilemap_get_id(sandLayer)
	tileIdSandBridge = layer_tilemap_get_id(sandBridgeLayer)
	tileIdBlue = layer_tilemap_get_id(middleLayer);
	tileIdWallTop = layer_tilemap_get_id(topLayer);
	tileIdWallBottom = layer_tilemap_get_id(middleWallLayer);
}

if gameMode == "gameplay"
{
	if timerClock == clock
	{
		tick = true;
		timerClock = false;
	}
	else
	{
		timerClock++;
		tick = false;
	}
	if gameTimeTimer == 60
	{
		gameTime++;
		gameTimeTimer = 0;
	}
	else
	{
		gameTimeTimer++;
	}	
}
if layer_exists(topLayer)
{
	//attemps to raise and lower the depth of the top layer of the wall to account for the player 
	//moving up and down in the room
	if instance_exists(obj_player_vic)
	{
		layer_depth(topLayer,obj_player_vic.depth - 164)
	}
}
//if layer_exists("layer_sand") and layer_exists("layer_sand_bridge")
//{
//	if !randomizeSand
//	{
//		randomizeSand = true;
//		var rmWidth = room_width/16
//		var rmHeight = room_height/16
//		for (var i = 0; i < rmWidth; i++)
//		{
//			for (var j = 0; j < rmHeight; j++)
//			{
//				var rand = irandom_range(30,38);
//				if tilemap_get(tileIdSand,i,j) == 10
//				{
//					var randTile = rand
//					tilemap_set(tileIdSand, randTile, i, j);
//				}
//			}
//		}
//	}
//	if !randomizeSandBridge
//	{
//		randomizeSandBridge = true;
//		var rmWidth = room_width/16
//		var rmHeight = room_height/16
//		for (var i = 0; i < rmWidth; i++)
//		{
//			for (var j = 0; j < rmHeight; j++)
//			{
//				var rand = irandom_range(30,38);
//				if tilemap_get(tileIdSandBridge,i,j) == 10
//				{
//					var randTile = rand
//					tilemap_set(tileIdSandBridge, randTile, i, j);
//				}
//			}
//		}
//	}	
//}
//randomize grass
if layer_exists("tile_middle")
{
	if !randomizeGrass
	{
		randomizeGrass = true;
		var rmWidth = room_width/16
		var rmHeight = room_height/16
		for (var i = 0; i < rmWidth; i++)
		{
			for (var j = 0; j < rmHeight; j++)
			{
				var rand = irandom_range(0,9);
				if tilemap_get(tileIdGrass,i,j) == 1
				{
					var randTile = rand + 1;
					tilemap_set(tileIdGrass, randTile, i, j);
				}
			}
		}
	}
	//ranodomize blue floor
	if !randomizeBlue
	{
		randomizeBlue = true;
		var rmWidth = room_width/16
		var rmHeight = room_height/16
		for (var i = 0; i < rmWidth; i++)
		{
			for (var j = 0; j < rmHeight; j++)
			{
				var rand = irandom_range(0,2);
				var randSpecial = irandom_range(0,19)
				if tilemap_get(tileIdBlue,i,j) == 11 //blue tiles
				{
					//show_message("GOT")
					var randTile = rand + 11;
					if randSpecial == 0
					{
						var randTile = 14;
					}
					tilemap_set(tileIdBlue, randTile, i, j);
				}
				if tilemap_get(tileIdBlue,i,j) == 15 //blue tiles
				{
					randSpecial = irandom_range(0,25)
					var randTile = 0;
					//show_message("GOT")
					if randSpecial == 17
					{
						randTile = 16;
					}
					else if randSpecial == 18
					{
						randTile = 17;
					}
					else if randSpecial == 19
					{
						randTile = 18;
					}
					else
					{
						randTile = 15;
					}
					tilemap_set(tileIdBlue, randTile, i, j);
				}
				if tilemap_get(tileIdWallBottom,i,j) == 13 //horizontal walls
				{
					
					randSpecial = irandom_range(0,20)
					var randTile = 0;
					//show_message("GOT")
					if randSpecial == 0
					{
						randTile = 14;
					}
					else if randSpecial == 1
					{
						randTile = 15;
					}
					else
					{
						randTile = 13;
					}
					tilemap_set(tileIdWallBottom, randTile, i, j);
				}
				if tilemap_get(tileIdWallBottom,i,j) == 22 //horizontal walls
				{
					randSpecial = irandom_range(0,20)
					var randTile = 0;
					if randSpecial == 0
					{
						randTile = 23;
					}
					else if randSpecial == 1
					{
						randTile = 24;
					}
					else
					{
						randTile = 22;
					}
					tilemap_set(tileIdWallBottom, randTile, i, j);
				}
				if tilemap_get(tileIdBlue,i,j) == 53 //stones
				{
					var temp = irandom_range(0,2)
					var randTile = 53 + temp;
					tilemap_set(tileIdBlue, randTile, i, j);
				}
				if tilemap_get(tileIdBlue,i,j) == 56 //fungus
				{
					var temp = irandom_range(0,1)
					var randTile = 56 + temp;
					tilemap_set(tileIdBlue, randTile, i, j);
				}
			}
		}
	}
}

if countSwitch 
{
	countSwitch = false;
	if instance_exists(obj_parent_enemy)
	{
		enemyNumHoverbot = instance_number(obj_enemy_hoverbot);
		enemyNumRollerbot = instance_number(obj_enemy_rollerbot);
		enemyNumEvilbot = instance_number(obj_enemy_evilbot);
		enemyNumMoverbot = instance_number(obj_enemy_moverbot);
		enemyNumLaserbot = instance_number(obj_enemy_moverbot);
	}
}
else
{
	enemyTotal = enemyNumHoverbot + enemyNumRollerbot +
	enemyNumEvilbot + enemyNumMoverbot + enemyNumLaserbot;
	if enemyTotal == 0
	{
		levelClear = "clear";
		if switchClearMsg
		{
			switchClearMsg = false;
			obj_control_ui.newLine = "ROBOTS EXTERMINATED. PROCEED TO TELEPORTER."
		}
	}
}
//}