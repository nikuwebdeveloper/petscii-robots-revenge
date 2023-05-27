//health
hp = 100;

//facing direction
dir = "up";

//free directions
freeMoveUp = false;
freeMoveRight = false;
freeMoveDown = false;
freeMoveLeft = false;

//idle animation counter
timerStill = 10

//current status
dead = false

//Vic's current weapon
currentWeapon = "none";

//weapon inventory
weaponPistol = false;
weaponPlasma = false;

//item inventory
itemHealthpack = false;
itemEmp = false;
itemMagnet = false;
itemBomb = false;

//item stock
itemHealthpackStock = 0;
itemEmpStock = 0;
itemMagnetStock = 0;
itemBombStock = 0;

//moving outside of tick
offUp = false;
offDown = false;
offRight = false;
offLeft = false;

//moves
move = false;
offMove = false;

//tile draw
layer_wall_top = layer_get_id("tile_wall_top");
tilemap_wall_top = layer_tilemap_get_id(layer_wall_top);
layer_wall_bottom = layer_get_id("tile_wall_bottom");
tilemap_wall_bottom = layer_tilemap_get_id(layer_wall_bottom);

//actions
push = false;

//reach
reachX = 0;
reachY = -16;

//obj for func_move
pushTarget = noone;
pushTargetBlocked = false;
