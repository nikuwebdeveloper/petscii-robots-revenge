event_inherited()
hsp = 0
vsp = 0

//health
hp = 100
pass = false
bulletDepth = - 3299
//facing direction
facing = DIR.UP

//hazard pit
fallSwitch = -1
hazardFallObj = noone

layerID = layer_get_id("layer_hazard")
tilemap = layer_tilemap_get_id(layerID)

//current status
dead = false
deathTimer = 0
deathTimerMax = 60*5
shootTurnTimer = 0
shootTurnTimerMax = 10

//gib
gibSwitch = true

enum OFF_MOVE
{
	NONE, 
	RIGHT, 
	UP, 
	LEFT, 
	DOWN
}

//moves
move = false
storeMove = OFF_MOVE.NONE

// turns on when stop moving then resets
switchBeginMove = true

//offshot
offShoot = false

//tile draw
layer_wall_top = layer_get_id("layer_tile_wallTop")
tilemap_wall_top = layer_tilemap_get_id(layer_wall_top)
layer_wall_bottom = layer_get_id("layer_tile_wallBottom")
tilemap_wall_bottom = layer_tilemap_get_id(layer_wall_bottom)

//reach
xReach = 0
yReach = 0

//obj for func_move
pushTarget = noone
pushTargetBlocked = false

//search target
searchTarget = noone

currentDir = DIR.UP
pushDir = DIR.UP

teleport = false
stop = false

//cardboards (draw sprite on top of instance)
if obj_inventory.currentWeapon == WEAPON.UNARMED
{
	sprite_index = spr_player_vic_idle_unarmed
}
else if obj_inventory.currentWeapon == WEAPON.PISTOL or obj_inventory.currentWeapon == WEAPON.PLASMA
{
	sprite_index = spr_player_vic_idle_pistol
}

spriteDir = 
{
	unarmed :
	[
		spr_player_vic_idle_unarmed,
		spr_player_vic_idle_unarmed,
		spr_player_vic_idle_unarmed,
		spr_player_vic_idle_unarmed,
	],
	pistol :
	[
		/* 0 */[spr_player_vic_walk_right_pistol, spr_player_vic_walk_right_pistol, spr_player_vic_walk_right_pistol, spr_player_vic_walk_right_pistol],
		/* 1 */[spr_player_vic_walk_up_shoot_right, spr_player_vic_walk_up_pistol, spr_player_vic_walk_up_shoot_left, spr_player_vic_walk_up_shoot_down],
		/* 2 */[spr_player_vic_walk_left_pistol, spr_player_vic_walk_left_pistol, spr_player_vic_walk_left_pistol, spr_player_vic_walk_left_pistol],
		/* 3 */[spr_player_vic_walk_down, spr_player_vic_walk_down_pistol, spr_player_vic_walk_down_pistol, spr_player_vic_walk_down_pistol]
	],
	plasma :
	[
		spr_player_vic_walk_right_pistol,
		spr_player_vic_walk_up_pistol,
		spr_player_vic_walk_left_pistol,
		spr_player_vic_walk_down_pistol
	]
}