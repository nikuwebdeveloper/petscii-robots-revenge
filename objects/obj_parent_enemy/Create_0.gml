event_inherited();

//shoot through
pass = false;
dir = "up";
hp = 1;
alert = true;

//pathfinding
path = 0;
grid = 0;

//cell size
cell_width = 16;
cell_height = 16;

//room size
hcells = room_width div cell_width;
vcells = room_height div cell_height;

//path add instance
addSwitch = true;

if object_index == obj_enemy_hoverbot
{
	path = path_add();
	grid = mp_grid_create(8,8, hcells, vcells, cell_width, cell_height);
	var randDir = irandom_range(0,1);
	if randDir == 0
	{
		dir = "up";
	}
	else
	{
		dir = "left";
	}
	hp = 10;
}