event_inherited()
hsp = 0
vsp = 0
 
drawWallHori = false
drawWallVert = false
 
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
shootTurnTimerMax = 20

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
facingDir = DIR.UP

teleport = false
stop = false

//cardboards (draw sprite on top of instance)
if global.currentWeapon== WEAPON.UNARMED
{
	sprite_index = spr_player_vic_idle_unarmed
}
else if global.currentWeapon== WEAPON.PISTOL or global.currentWeapon== WEAPON.PLASMA
{
	sprite_index = s_vic_idle
}

spriteDir = 
{
	unarmed :
	[
		[spr_player_vic_walk_right_unarmed,spr_player_vic_walk_right_unarmed,spr_player_vic_walk_right_unarmed,spr_player_vic_walk_right_unarmed],
		[spr_player_vic_walk_up_unarmed,spr_player_vic_walk_up_unarmed,spr_player_vic_walk_up_unarmed,spr_player_vic_walk_up_unarmed],
		[spr_player_vic_walk_left_unarmed,spr_player_vic_walk_left_unarmed,spr_player_vic_walk_left_unarmed,spr_player_vic_walk_left_unarmed],
		[spr_player_vic_walk_down_unarmed,spr_player_vic_walk_down_unarmed,spr_player_vic_walk_down_unarmed,spr_player_vic_walk_down_unarmed],
	],
	pistol :
	[
		/* right, up, left, down*/
		/* 0 */[s_vic_right_sRight, s_vic_right_sUp, s_vic_right_sLeft, s_vic_right_sDown], /* done */
		/* 1 */[s_vic_up_sRight, s_vic_up_sUp, s_vic_up_sLeft, s_vic_up_sDown], /* done */
		/* 2 */[s_vic_left_sRight, s_vic_left_sUp, s_vic_left_sLeft, s_vic_left_sDown],
		/* 3 */[s_vic_down_sRight, s_vic_down_sUp, s_vic_down_sLeft, s_vic_down_sDown] /* done */
	],
	plasma :
	[
		/* right, up, left, down*/
		/* 0 */[s_vic_right_sRight, s_vic_right_sUp, s_vic_right_sLeft, s_vic_right_sDown], /* done */
		/* 1 */[s_vic_up_sRight, s_vic_up_sUp, s_vic_up_sLeft, s_vic_up_sDown], /* done */
		/* 2 */[s_vic_left_sRight, s_vic_left_sUp, s_vic_left_sLeft, s_vic_left_sDown],
		/* 3 */[s_vic_down_sRight, s_vic_down_sUp, s_vic_down_sLeft, s_vic_down_sDown] /* done */
	]
}

letGo = false