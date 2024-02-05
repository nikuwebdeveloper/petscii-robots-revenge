//health
hp = 100;
pass = false;
bulletDepth = -3299;
//facing direction
dir = "up";

//hazard pit
fallSwitch = -1
hazardFallObj = noone

layerID = layer_get_id("layer_hazard")
tilemap = layer_tilemap_get_id(layerID)

//idle animation counter
timerStill = 10

//current status
dead = false
deathTimer = 0;
deathTimerMax = 60*5

//gib
gibSwitch = true;

//moves
move = false;
offMove = false;
offMoveUp = false;
offMoveDown = false;
offMoveLeft = false;
offMoveRight = false;
errorMove = false;


//offshot
offShoot = false;

//tile draw
layer_wall_top = layer_get_id("tile_wall_top");
tilemap_wall_top = layer_tilemap_get_id(layer_wall_top);
layer_wall_bottom = layer_get_id("tile_wall_bottom");
tilemap_wall_bottom = layer_tilemap_get_id(layer_wall_bottom);

//reach
reachX = 0;
reachY = 0;

//obj for func_move
pushTarget = noone;
pushTargetBlocked = false;

//search target
searchTarget = noone;

currentDir = "up";
pushDir = "up";

teleport = false;