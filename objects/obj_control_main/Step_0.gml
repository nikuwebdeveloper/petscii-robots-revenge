if !switchLayerRead
{
	switchLayerRead = true;
	//layers
	topLayer =  layer_get_id("tile_wall_top");
	grassLayer = layer_get_id("tile_middle");
	//tilemap ids
	tileIdGrass = layer_tilemap_get_id(grassLayer);
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
}

//layer_depth("tile_wall_top", obj_player_vic.depth - 64)

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
				var rand = irandom_range(0,2);
				if tilemap_get(tileIdGrass,i,j) == 1
				{
					if rand == 0
					{
						randTile = 1; 
					}
					else if rand == 1
					{
						randTile = 2;
					}
					else
					{
						randTile = 3
					}
					//var tile = tilemap_get(tileIdGrass,i,j)
					//var randFlip = irandom_range(0,1);
					//var randMirror = irandom_range(0,1);
					//tile_set_flip(randTile,true); //usure if works
					////tile_set_mirror(randTile, true) //unsure if works
					tilemap_set(tileIdGrass, randTile, i, j);
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