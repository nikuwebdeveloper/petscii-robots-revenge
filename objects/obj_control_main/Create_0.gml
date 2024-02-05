//initially change rooms to gameplay
room = room_test;

//set game mode
gameMode = "gameplay";

//clock
tick = false;
clock = 6;
timerClock = 0;

//tile randomization
randomizeGrass = false;
randomizeBlue = false;
randomizeStones = false;
randomizeFungus = false;
randomizeSand = false
randomizeSandBridge = false

//initial
switchLayerRead = false;

//initial layers
topLayer = 0;
grassLayer = 0;
//initial tilemap ids
tileIdGrass = 0;
tileIdBlue = 0;
middleWallLayer = 0;

//enemy numbers
enemyNumHoverbot = 0;
enemyNumRollerbot = 0;
enemyNumEvilbot = 0;
enemyNumMoverbot = 0;
enemyNumLaserbot = 0;
enemyTotal = 0;

countSwitch = true;
switchMaze = true;

//level 
levelNum = 0;
levelName = "TEST";
secretRemain = 0;
gameTime = 0;
gameTimeTimer = 0;
difficulty = 0;
levelClear = "none";
switchClearMsg = true;
secrectNum = 0;

draw_set_font(font_mincho_8);