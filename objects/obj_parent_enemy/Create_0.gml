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




//path add instance
addSwitch = true;

if object_index == obj_enemy_hoverbot
{
	path = path_add();
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
	spriteDir =
	{
		move: [spr_enemy_hoverbot_right, spr_enemy_hoverbot_up, spr_enemy_hoverbot_left, spr_enemy_hoverbot_down],
		attack:[spr_enemy_hoverbot_right, spr_enemy_hoverbot_up, spr_enemy_hoverbot_left, spr_enemy_hoverbot_down]
	}
}
else if object_index == obj_enemy_moverbot
{
	path = path_add();
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
	spriteDir =
	{
		move: [spr_enemy_moverbot_right, spr_enemy_moverbot_up, spr_enemy_moverbot_left, spr_enemy_moverbot_down],
		attack:[spr_enemy_moverbot_right_attack, spr_enemy_moverbot_up_attack, spr_enemy_moverbot_left_attack, spr_enemy_moverbot_down]
	}
}