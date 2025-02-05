if hp <= 0
{
    var currentTilemap = layer_tilemap_get_id(layer_get_id("layer_tile_middle"))
    var targetOne = instance_place(x,y,obj_env_wall) // left
    //keep 15 - collision issue
	var targetTwo = instance_place(x + 15,y,obj_env_wall) // right
    targetOne.die = true // left
    targetTwo.die = true // right
    instance_create_depth(x, y, depth, obj_effect_explosion) // left
    instance_create_depth(x + 16, y, depth, obj_effect_explosion) // right
    var xTileLocation = ceil(x / 16)
    var yTileLocation = ceil(y / 16)
    tilemap_set(currentTilemap, 50, xTileLocation, yTileLocation) // left
    tilemap_set(currentTilemap, 50, xTileLocation + 1, yTileLocation) // right
    instance_destroy() // destroy broken wall
}