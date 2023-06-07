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
randomizeStones = false;
randomizeFungus = false;

//initial
switchLayerRead = false;

//initial layers
topLayer = 0;
grassLayer = 0;
//initial tilemap ids
tileIdGrass = 0;

//enemy numbers
enemyNumHoverbot = 0;
enemyNumRollerbot = 0;
enemyNumEvilbot = 0;
enemyNumMoverbot = 0;
enemyNumLaserbot = 0;

countSwitch = true;

draw_set_font(font_mincho_8);