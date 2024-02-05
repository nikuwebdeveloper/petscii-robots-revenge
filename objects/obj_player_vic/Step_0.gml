event_inherited();
if obj_control_main.gameMode == "gameplay"
{
	if !dead
	{
		switch dir
		{
			case "up":
				xReach = 0
				yReach = -8
				break
			case "down":
				xReach = 0
				yReach = 8
				break
			case "left":
				xReach = -8
				yReach = 0
				break
			case "right":
				xReach = 8
				yReach = 0
				break
		}
		//hazard pit
		var hazardDir = 0

		if place_meeting(x,y,obj_hazard) and place_meeting(x,y,obj_env_autoBridge_chunk)
		{
			hazardFallObj = instance_place(x,y,obj_env_autoBridge_chunk)
		}
		if place_meeting(x,y,obj_hazard) and !place_meeting(x,y,obj_env_autoBridge_chunk)
		{
			fallSwitch = 0
			if instance_exists(hazardFallObj)
			{
				
			}
		}
		if fallSwitch == 0
		{
			if dir == "up"
			{
				//y-= 16
			}
			else if dir == "down"
			{
				y+= 16
			}
			else if dir == "left"
			{
				x += 16
			}
			else if dir == "right"
			{
				y+= 16
			}
			fallSwitch = 1
			dead = true
		}
		
		if instance_exists(obj_parent_shot_player)
		{
			bulletDepth = -3299; //set bullet depth higher than the lowest y position for y = -y - x
		}
		if obj_control_main.levelClear == "clear" and obj_control_main.tick //robots are all dead
		{
			if place_meeting(x+reachX,y+reachY,obj_env_teleporter_base) //oppisite!
			{
				teleport = true;
				x = obj_env_teleporter_base.x; //move to teleporter
				y = obj_env_teleporter_base.y;
			}
			if teleport
			{
				if !instance_exists(obj_effect_portal) //create one portal
				{
					instance_create_depth(obj_env_teleporter_base.x,obj_env_teleporter_base.y,depth,obj_effect_portal); 
				}
				sprite_index = spr_player_vic_teleport; //fade vic out
				if image_index >= 43 //change rooms once vic's animation is over
				{
					teleport = false; //reset
					obj_control_main.gameMode = "status";
					room = room_status;
				}
			}
		}
		//set dead
		if hp <= 0
		{
			dead = true;
		}
		if !teleport
		{
			//use item
			if obj_control_input.input_use
			{
				if obj_control_inventory.currentItem == "itemHealthPack"
				{
					if hp < 100
					{
						if hp + obj_control_inventory.itemHealthPackStock <= 100
						{
							hp = hp + obj_control_inventory.itemHealthPackStock;
							obj_control_inventory.itemHealthPackStock = 0;
						}
						else if hp + obj_control_inventory.itemHealthPackStock > 100
						{
							var total = hp + obj_control_inventory.itemHealthPackStock;
							var overflow = total - 100;
							obj_control_inventory.itemHealthPackStock = overflow;
							hp = 100;
						}
					}
				}
				else if obj_control_inventory.currentItem == "itemBomb"
				{
					if obj_control_input.input_use
					{
						if obj_control_inventory.itemBombStock > 0
						{
							instance_create_depth(x+reachX,y+reachY, depth, obj_deployable_bomb)
							obj_control_inventory.itemBombStock--;
						}
					}	
				}
				else if obj_control_inventory.currentItem == "itemMagnet"
				{
					if obj_control_input.input_use
					{
						if obj_control_inventory.itemMagnetStock > 0
						{
							instance_create_depth(x+reachX,y+reachY, depth, obj_deployable_magnet)
							obj_control_inventory.itemMagnetStock--;
						}
					}		
				}
				else if obj_control_inventory.currentItem == "itemEmp"
				{
					if obj_control_input.input_use
					{
						if obj_control_inventory.itemEmpStock > 0
						{
							instance_create_depth(x+reachX,y+reachY, depth, obj_deployable_emp)
							obj_control_inventory.itemEmpStock--;
						}
					}		
				}
			}
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
								obj_control_ui.newLine = "YOU PICKED UP A MEDKIT.";
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
					else
					{
						obj_control_ui.newLine = "NOTHING THERE.";
						searchTarget.searched = true;
					}
					if searchTarget.object_index == obj_env_switch
					{
						var target = searchTarget
						if target.active
						{
							target.active = false
						}
						else
						{
							target.active = true
						}
					}
				}
			}
			//find push target
			else if obj_control_input.input_toggle_push
			{
				if pushTarget != noone
				{
					pushTarget = noone;
					dir = pushDir;
				}
				else
				{
					pushDir = dir;
					pushTarget = instance_place(x + reachX, y + reachY, obj_parent_solid)
					if pushTarget != noone
					{
						if !pushTarget.canMove
						{
							pushTarget = noone;
						}
					}
				}
			}
			if obj_control_input.input_move_up_press or obj_control_input.input_move_down_press
			or obj_control_input.input_move_right_press or obj_control_input.input_move_left_press
			{
				image_index = 0;
			}
			if !obj_control_main.tick
			{
				if obj_control_input.input_move_up_press
				{
					dir = "up";
					func_reach(dir);
					offMoveUp = true;
					offMoveDown = false;
					offMoveLeft = false;
					offMoveRight = false;
				}
				else if obj_control_input.input_move_down_press
				{
					dir = "down";
					func_reach(dir);
					offMoveUp = false;
					offMoveDown = true;
					offMoveLeft = false;
					offMoveRight = false;
				}
				else if obj_control_input.input_move_left_press
				{
					dir = "left";
					func_reach(dir);
					offMoveUp = false;
					offMoveDown = false;
					offMoveLeft = true;
					offMoveRight = false;
				}
				else if obj_control_input.input_move_right_press
				{
					dir = "right";
					func_reach(dir);
					offMoveUp = false;
					offMoveDown = false;
					offMoveLeft = false;
					offMoveRight = true;
				}
			}
			else if obj_control_main.tick
			{
				if obj_control_input.input_move_up_hold or offMoveUp
				{
					dir = "up";
					func_reach(dir);
					func_move_push(dir, id, pushTarget, reachX, reachY) 
					offMoveUp = false;
				}
				 else if obj_control_input.input_move_down_hold or offMoveDown
				{
					dir = "down";
					func_reach(dir);
					func_move_push(dir, id, pushTarget, reachX, reachY)
					offMoveDown = false;
				}
				else if obj_control_input.input_move_left_hold  or offMoveLeft
				{
					dir = "left";
					func_reach(dir);
					func_move_push(dir, id, pushTarget, reachX, reachY)
					offMoveLeft = false;
				}
				else if obj_control_input.input_move_right_hold  or offMoveRight
				{
					dir = "right";
					func_reach(dir);
					func_move_push(dir, id, pushTarget, reachX, reachY) 
					offMoveRight = false;
				}
			}

			//shooting
			if obj_control_inventory.currentWeapon != "none"
			{
				//shooting directions
				if obj_control_input.input_shoot_up_press
				{
					if obj_control_inventory.currentWeapon == "weaponPistol"
					{
						if obj_control_inventory.weaponPistolAmmo > 0
						{
							var target = instance_create_depth(x,y,bulletDepth,obj_shot_player_pistol)
							target.dir = "up";
							target.sprite_index = spr_shot_player_pistol_up;
							obj_control_inventory.weaponPistolAmmo--;
						}
					}
					else if obj_control_inventory.currentWeapon == "weaponPlasma"
					{
						if obj_control_inventory.weaponPlasmaAmmo > 0
						{
							var target = instance_create_depth(x,bbox_top-8,bulletDepth,obj_shot_player_plasma)
							target.dir = "up";
							obj_control_inventory.weaponPlasmaAmmo--;
						}
					}
					//dir = "up";
					//sprite_index = spr_player_vic_idle_pistol
					//image_index = 0;
				}
				if obj_control_input.input_shoot_down_press
				{
					if obj_control_inventory.currentWeapon == "weaponPistol"
					{
						if obj_control_inventory.weaponPistolAmmo > 0
						{
							var target = instance_create_depth(x,y,bulletDepth,obj_shot_player_pistol)
							target.dir = "down";
							target.sprite_index = spr_shot_player_pistol_down;
							obj_control_inventory.weaponPistolAmmo--;
						}
					}
					else if obj_control_inventory.currentWeapon == "weaponPlasma"
					{
						if obj_control_inventory.weaponPlasmaAmmo > 0
						{
							var target = instance_create_depth(x,bbox_bottom+8,bulletDepth,obj_shot_player_plasma)
							target.dir = "down";
							obj_control_inventory.weaponPlasmaAmmo--;
						}
					}
					//dir = "down";
					//sprite_index = spr_player_vic_idle_pistol
					//image_index = 2;
				}
				if obj_control_input.input_shoot_left_press
				{
					if obj_control_inventory.currentWeapon == "weaponPistol"
					{
						if obj_control_inventory.weaponPistolAmmo > 0
						{
							var target = instance_create_depth(x,y,bulletDepth,obj_shot_player_pistol)
							target.dir = "left";
							target.sprite_index = spr_shot_player_pistol_left
							obj_control_inventory.weaponPistolAmmo--;
						}
					}
					else if obj_control_inventory.currentWeapon == "weaponPlasma"
					{
						if obj_control_inventory.weaponPlasmaAmmo > 0
						{
							var target = instance_create_depth(bbox_left-8,y,bulletDepth,obj_shot_player_plasma)
							target.dir = "left";
							obj_control_inventory.weaponPlasmaAmmo--;
						}
					}
					//dir = "left";
					//sprite_index = spr_player_vic_idle_pistol
					//image_index = 3;
				}
				if obj_control_input.input_shoot_right_press
				{
					if obj_control_inventory.currentWeapon == "weaponPistol"
					{
						if obj_control_inventory.weaponPistolAmmo > 0
						{
							var target = instance_create_depth(x,y,bulletDepth,obj_shot_player_pistol)
							target.dir = "right";
							target.sprite_index = spr_shot_player_pistol_right;
							obj_control_inventory.weaponPistolAmmo--;
						}
					}
					else if obj_control_inventory.currentWeapon == "weaponPlasma"
					{
						if obj_control_inventory.weaponPlasmaAmmo > 0
						{
							var target = instance_create_depth(bbox_right+8,y,bulletDepth,obj_shot_player_plasma)
							target.dir = "right";
							obj_control_inventory.weaponPlasmaAmmo--;
						}
					}
					//dir = "right";
					//sprite_index = spr_player_vic_idle_pistol
					//image_index = 1;
				}
				
				if dir == "up"
				{

				}
				if dir == "right"
				{
				
				}
				if dir == "down"
				{
				
				}
				if dir == "left"
				{
				
				}
			}
		}
	}
	else if dead
	{
		teleport = false; //reset
		obj_control_main.levelClear = "fail";
		if deathTimer == deathTimerMax
		{
			deathTimer = 0;
			obj_control_main.gameMode = "status";
			room = room_status;
		}
		else
		{
			deathTimer++;
		}
		if hp < -75
		{
			if gibSwitch
			{
				gibSwitch = false;
				instance_create_depth(x,y,bulletDepth,obj_effect_explosion);
				sprite_index = spr_empty;
			}
		}
		else
		{
			sprite_index = spr_player_vic_dead;
		}
	}
}