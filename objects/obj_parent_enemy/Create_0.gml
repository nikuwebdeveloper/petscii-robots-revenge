event_inherited();

//direction facing
facing = DIR.UP;

//health
hp = 1;

//combat
mode = MODE.IDLE;
confuseTimer = 0;
confuseTimerMax = 30;
stunTimer = 0;
stunTimerMax = 30;
attack = false;
alertTarget = noone;
spark = noone;
deathSwitch = true;
moveable = false;

//shoot through
pass = false;

//pathfinding
path = 0;
grid = 0;

//cell size
cell_width = 8;
cell_height = 8;

//room size
hcells = room_width div cell_width;
vcells = room_height div cell_height;


//path add instance
addSwitch = true;

if object_index == obj_enemy_hoverbot
{
	path = path_add();
	grid = mp_grid_create(0, 0, hcells, vcells, cell_width, cell_height);
	var randDir = irandom_range(0,1);
	if randDir == 0
	{
		facing = DIR.UP;
	}
	else
	{
		facing = DIR.LEFT;
	}
	hp = 10;
}