#region LAYERS
// set layers so tiles can be randomized
if switchLayerRead
{
	switchLayerRead = false
	tilemapSand = layer_tilemap_get_id(layer_get_name("layegr_sand"))
	tilemapSandBridge = layer_tilemap_get_id(layer_get_name("layer_sand_bridge"))
	tilemapMiddle = layer_tilemap_get_id(layer_get_name("layer_tile_middle"))
	tilemapWallTop = layer_tilemap_get_id(layer_get_name("layer_tile_wallTop"))
}
// ???
// if switchWallDepth
// {
// 	switchWallDepth = false
// 	layerInteract = layer_get_id("layer_instance_interact")
// 	if layer_exists(layerInteract)
// 	{
// 		layer = layer_get_depth(layerInteract)
// 	}
// }
if layer_exists(topLayer)
{
	//attemps to raise and lower the depth of the top layer of the wall to account for the player 
	//moving up and down in the room
	if instance_exists(obj_player_vic)
	{
		layer_depth(topLayer,obj_player_vic.depth - 164)
	}
}
#endregion

#region GAME TIME

// game clock so everything works step by step 
if gameMode == GAMEMODE.GAMEPLAY
{
	if room != room_initial
	{
		if flipperWallDepth
		{
			flipperWallDepth = false
			if instance_exists(obj_control_ui)
			{
				if layer_exists("layer_tile_wallTop")
				{
					
					layer_depth("layer_tile_wallTop", obj_control_ui.depth + 1)
				}
			}
		}
	}
	// if timerClock == clock
	// {
	// 	// tick is period of time where actions happen
	// 	tick = true
	// 	timerClock = 0
	// }
	// else
	// {
	// 	timerClock++;
	// 	tick = false
	// }
	
	// counts how long the game has been played for
	// one second
	if gameTimeTimer == 60
	{
		gameTime++
		gameTimeTimer = 0
	}
	else
	{
		gameTimeTimer++
	}	
}
#endregion

#region TILES
// randomize layer_tile_middle tiles
if layer_exists("layer_tile_middle")
{
	if switchRandomizeTile
	{
		switchRandomizeTile = false
		var currentTilemap = tilemapMiddle
		var rmWidth = room_width / 16
		var rmHeight = room_height / 16
		for (var i = 0; i < rmWidth; i++)
		{
			for (var j = 0; j < rmHeight; j++)
			{
				var currentTile = tilemap_get(currentTilemap,i,j) 
				// if current tile is a type to be randomized
				if currentTile == 1 or currentTile == 11 or currentTile == 15 or currentTile == 53 or currentTile == 56
				{
					// tile has a chance to be randomized 50% of the time
					var randLimiter = irandom(1)
					if randLimiter == 0
					{
						switch currentTile
						{
							// grass
							case 1:
								randTile = irandom_range(1,10)
							break
							// slab
							case 11:
								randTile = irandom_range(11,14)
							break
							// carpet
							case 15:
								randTile = irandom_range(15,18)
							break
							// stone path
							case 53:
								randTile= irandom_range(53,55)
							break
							// fungus
							case 56:
								randTile = irandom_range(56,57)
							break
						}
						//set new tile
						tilemap_set(currentTilemap, randTile, i, j)
					}
				}
			}
		}
	}
}
#endregion

#region COUNT ENEMIES + END LEVEL
//count enemy number
if switchEnemyDeadCount 
{
	switchEnemyDeadCount = false;
	if instance_exists(obj_parent_enemy)
	{
		enemyCount.hoverbot = instance_number(obj_enemy_hoverbot);
		enemyCount.rollerbot = instance_number(obj_enemy_hoverbot);
		enemyCount.evilbot = instance_number(obj_enemy_hoverbot);
		enemyCount.moverbot = instance_number(obj_enemy_hoverbot);
		enemyCount.laserbot = instance_number(obj_enemy_hoverbot);
	}
}
else
{
	enemyCount.total = enemyCount.hoverbot +enemyCount.rollerbot + enemyCount.evilbot + enemyCount.moverbot + enemyCount.laserbot
	if enemyCount.total == 0
	{
		levelClear = levelCurrent.levelClear.CLEAR
		if switchClearMsg
		{
			switchClearMsg = false;
			obj_control_ui.newLine = "ROBOTS EXTERMINATED. PROCEED TO TELEPORTER."
		}
	}
}
#endregion