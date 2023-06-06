event_inherited();
if obj_control_main.gameMode == "gameplay"
{
	if !dead
	{
		//search
		if obj_control_input.input_search
		{
			searchTarget = instance_place(x + reachX, y + reachY, obj_parent_env)
			if instance_exists(searchTarget)
			{
				if searchTarget.item != "none"
				{
					switch (searchTarget.item)
					{
						case "weaponPistol":
							obj_control_inventory.weaponPistol = true;
							obj_control_inventory.weaponPistolAmmo += obj_control_inventory.weaponPistolAdd;
							obj_control_ui.newLine = "YOU PICKED UP A PISTOL.";
							break;
						case "weaponPlasma":
							obj_control_inventory.weaponPlasma = true;
							obj_control_inventory.weaponPlasmaAmmo += obj_control_inventory.weaponPlasmaAdd;
							obj_control_ui.newLine = "YOU PICKED UP A PLASMA GUN.";
							
							break;
						case "itemHealthPack":
							obj_control_inventory.itemHealthPack = true;
							obj_control_inventory.itemHealthPackStock += obj_control_inventory.itemHealthPackAdd;
							obj_control_ui.newLine = "YOU PICKED UP A HEALTH PACK.";
							break;		
						case "itemEmp":
							obj_control_inventory.itemEmp = true;
							obj_control_inventory.itemEmpStock += obj_control_inventory.itemEmpAdd;
							obj_control_ui.newLine = "YOU PICKED UP SOME EMPS.";
							break;		
						case "itemMagnet":
							obj_control_inventory.itemMagnet = true;
							obj_control_inventory.itemMagnetStock += obj_control_inventory.itemMagnetAdd;
							obj_control_ui.newLine = "YOU PICKED UP SOME MAGNETS.";
							break;		
						case "itemBomb":
							obj_control_inventory.itemBomb = true;
							obj_control_inventory.itemBombStock += obj_control_inventory.itemBombAdd;
							obj_control_ui.newLine = "YOU PICKED UP SOME BOMBS.";
							break;								
					}
					if searchTarget.item == "weaponPistol" or searchTarget.item == "weaponPlasma"
					{
						obj_control_inventory.currentWeapon = searchTarget.item;
					}
					if searchTarget.item != "weaponPistol" and searchTarget.item != "weaponPlasma"
					{
						obj_control_inventory.currentItem = searchTarget.item;
					}
					searchTarget.searched = true;
					searchTarget.item = "none";
				}
			}
		}
		//find push target
		else if obj_control_input.input_toggle_push
		{
			if pushTarget != noone
			{
				pushTarget = noone;
			}
			else
			{
				pushTarget = instance_place(x + reachX, y + reachY, obj_parent_solid)
				if !pushTarget.canMove
				{
					pushTarget = noone;
				}
			}
		}
		//decide movement direction
		if obj_control_input.input_move_up_press or obj_control_input.input_move_up_hold
		{
			dir = "up";
			move = true;
		}
		else if obj_control_input.input_move_down_press or obj_control_input.input_move_down_hold
		{
			dir = "down";
			move = true;
		}
		else if obj_control_input.input_move_left_press or obj_control_input.input_move_left_hold
		{
			dir = "left";
			move = true;
		}
		else if obj_control_input.input_move_right_press or obj_control_input.input_move_right_hold
		{
			dir = "right";
			move = true;
		}
		
		//turn off moves if not touching anything
		if !obj_control_input.input_move_up_press and !obj_control_input.input_move_up_hold and
		!obj_control_input.input_move_down_press and !obj_control_input.input_move_down_hold and
		!obj_control_input.input_move_left_press and !obj_control_input.input_move_left_hold and
		!obj_control_input.input_move_right_press and !obj_control_input.input_move_right_hold
		{
			offMove = false;
			move = false;
		}
		
		//actual move
		if move or offMove
		{
			if obj_control_main.tick
			{
				func_move_push(dir, id, pushTarget, reachX, reachY)
				move = false;
				offMove = false;
			}
			else
			{
				offMove = true;
			}
		}
		if obj_control_inventory.currentWeapon != "none"
		{
			//shoot
			if obj_control_input.input_shoot_up_press
			{
				if obj_control_inventory.weaponPistolAmmo > 0
				{
					var target = instance_create_depth(x,y-16,depth,obj_shot_player_pistol)
					target.dir = "up";
					obj_control_inventory.weaponPistolAmmo--;
				}
				dir = "up";
				sprite_index = spr_player_vic_idle_pistol
				image_index = 0;
			}
			if obj_control_input.input_shoot_down_press
			{
				if obj_control_inventory.weaponPistolAmmo > 0
				{
					var target = instance_create_depth(x,y+16,depth,obj_shot_player_pistol)
					target.dir = "down";
					obj_control_inventory.weaponPistolAmmo--;
				}
				dir = "down";
				sprite_index = spr_player_vic_idle_pistol
				image_index = 2;
			}
			if obj_control_input.input_shoot_left_press
			{
				if obj_control_inventory.weaponPistolAmmo > 0
				{
					var target = instance_create_depth(x-16,y,depth,obj_shot_player_pistol)
					target.dir = "left";
					obj_control_inventory.weaponPistolAmmo--;
				}
				dir = "left";
				sprite_index = spr_player_vic_idle_pistol
				image_index = 3;
			}
			if obj_control_input.input_shoot_right_press
			{
				if obj_control_inventory.weaponPistolAmmo > 0
				{
					var target = instance_create_depth(x+16,y,depth,obj_shot_player_pistol)
					target.dir = "right";
					obj_control_inventory.weaponPistolAmmo--;
				}
				dir = "right";
				sprite_index = spr_player_vic_idle_pistol
				image_index = 1;
			}
		}
	}
}