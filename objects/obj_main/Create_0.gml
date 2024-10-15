draw_set_font(font_mincho_8);
#macro GREEN #43e232

//gameplay mode
enum GAMEMODE
{
	GAMEPLAY,
	STATUS,
}
enum DIR
{
	RIGHT,
	UP,
	LEFT,
	DOWN
}
enum WEAPON
{
	NONE,
	UNARMED,
	PISTOL,
	PLASMA
}

enum ITEM
{
	NONE,
	MEDKIT,
	EMP,
	MAGNET,
	BOMB,
}

enum MODE
{
	IDLE,
	ALERT,
	ATTACK,
	CONFUSE,
	STUN,
	DEAD
}

enum LEVEL_CLEAR
{
	NONE,
	CLEAR,
	FAIL
}

enum TILE
{
	GRASS,
	SLAB_4,
	SAND,
	WALL_HORI,
	WALL_VERT,
	STONE_PATH,
	FUNGUS,
}

//set game mode
gameMode = GAMEMODE.GAMEPLAY

//clock
tick = false;
clock = 3
timerClock = 0;

//tile randomization
switchRandomizeTile = true
randomizeGrass = false;
randomizeBlue = false;
randomizeStones = false;
randomizeFungus = false;
randomizeSand = false
randomizeSandBridge = false

//initial
switchLayerRead = true

//initial layers
topLayer = 0;
grassLayer = 0;
//initial tilemap ids
tilemapGrass = 0;
tilemapBlue = 0;
tilemapMiddle = 0;
middleWallLayer = 0;

//enemy numbers
enemyCount = 
{
	hoverbot : 0,
	rollerbot : 0,
	evilbot : 0,
	moverbot : 0,
	laserbot : 0,
	total : 0
}

switchEnemyDeadCount = true;
switchMaze = true;

//level 
levelNum = 0;
levelName = "TEST";
secretRemain = 0;
gameTime = 0;
gameTimeTimer = 0;
difficulty = 0;
levelClear = LEVEL_CLEAR.NONE
switchClearMsg = true;
secrectNum = 0;

levelGroup =
{
	level0 :
	{
		num : 0,
		name : "ZERO",
		secretNum : 0,
		levelClear : LEVEL_CLEAR.NONE
	},
	level1 :
	{
		num : 1,
		name : "ONE",
		secretNum : 0,
		levelClear : LEVEL_CLEAR.NONE
	},
	
}

levelCurrent = levelGroup.level0

//initially change rooms to gameplay
if room == room_initial
{
	room = room_test
}

//tilemap ids
tilemapGrass = 0
tilemapSand = 0
tilemapSandBridge = 0
tilemapBlue = 0
tilemapWallTop = 0
tilemapWallBottom = 0

//randGrass = irandom_range(1,10)
//randSlab = irandom_range(11,14)
//randCarpet = irandom_range(15,18)
//randStonePath= irandom_range(53,55)
//randFungus = irandom_range(56,57)
randTile = 0

flipperWallDepth = true

layerInteract = 0

#region PARAMATER GROUPS

#endregion