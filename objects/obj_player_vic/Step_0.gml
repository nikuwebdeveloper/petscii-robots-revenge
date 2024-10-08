event_inherited()
if obj_main.gameMode == GAMEMODE.GAMEPLAY
{
	if alive
	{
		#region HAZARD
		#endregion

		if instance_exists(obj_parent_shot_player)
		{	/*FIX THIS*/
			bulletDepth = - 3299 //set bullet depth higher than the lowest y position for y = - y - x
		}
		if obj_main.levelClear == "clear" and obj_main.tick //robots are all dead
		{
			if place_meeting(x + xReach, y + yReach, obj_env_teleporter_base) //oppisite!
			{
				teleport = true
				x = obj_env_teleporter_base.x //move to teleporter
				y = obj_env_teleporter_base.y
			}
			if teleport
			{
				if !instance_exists(obj_effect_portal) //create one portal
				{
					instance_create_depth(obj_env_teleporter_base.x, obj_env_teleporter_base.y, depth, obj_effect_portal) 
				}
				sprite_index = spr_player_vic_teleport //fade vic out
				if image_index >= 43 //change rooms once vic's animation is over
				{
					teleport = false //reset
					obj_main.gameMode = GAMEMODE.STATUS
					room = room_status
				}
			}
		}
		//set dead
		if hp <= 0
		{
			dead = true
		}
		//use item
		if obj_input.use
		{
			if obj_inventory.currentItem == ITEM.MEDKIT
			{
				// complilcated routine to not overuse medkit
				if hp < 100
				{
					if hp + obj_inventory.itemHealthPackStock <= 100
					{
						hp = hp + obj_inventory.itemHealthPackStock
						obj_inventory.itemHealthPackStock = 0
					}
					else if hp + obj_inventory.itemHealthPackStock > 100
					{
						var total = hp + obj_inventory.itemHealthPackStock
						var overflow = total - 100
						obj_inventory.itemHealthPackStock = overflow
						hp = 100
					}
				}
			}
			else if obj_inventory.currentItem == ITEM.BOMB
			{
				if obj_inventory.itemBombStock > 0
				{
					instance_create_depth(x + xReach, y + yReach, depth, obj_deployable_bomb)
					obj_inventory.itemBombStock--
				}
			}
			else if obj_inventory.currentItem == ITEM.MAGNET
			{
				if obj_inventory.itemMagnetStock > 0
				{
					instance_create_depth(x + xReach, y + yReach, depth, obj_deployable_magnet)
					obj_inventory.itemMagnetStock--
				}
			}
			else if obj_inventory.currentItem == ITEM.EMP
			{
				if obj_inventory.itemEmpStock > 0
				{
					instance_create_depth(x + xReach, y + yReach, depth, obj_deployable_emp)
					obj_inventory.itemEmpStock--
				}
			}
			else if obj_inventory.currentItem == ITEM.NONE
			{
				obj_control_ui.newLine = "YOU HAVE NO ITEM SELECTED."
			}
		}
		
		// search for item
		if obj_input.search
		{
			//identify target to search
			var searchTarget = instance_place(x + xReach, y + yReach, obj_parent_env)
			// if the search target exists
			if instance_exists(searchTarget)
			{
				// if it hasn't been already searched
				if !searchTarget.searched
				{
					// set searched to true
					searchTarget.searched = true
					// if empty
					if searchTarget.item == ITEM.NONE and searchTarget.weapon == WEAPON.NONE
					{
						obj_control_ui.newLine = "NOTHING THERE."
					}
					// has something
					else
					{
						// if it has an item
						if searchTarget.item != ITEM.NONE
						{
							switch searchTarget.item
							{
								case ITEM.MEDKIT:
									obj_inventory.hasItemMedkit = true
									obj_inventory.itemHealthPackStock += obj_inventory.itemHealthPackAdd
									obj_control_ui.newLine = "YOU PICKED UP A MEDKIT."
									break		
								case ITEM.EMP:
									obj_inventory.itemEmp = true
									obj_inventory.itemEmpStock += obj_inventory.itemEmpAdd
									obj_control_ui.newLine = "YOU PICKED UP SOME EMPS."
									break		
								case ITEM.MAGNET:
									obj_inventory.itemMagnet = true
									obj_inventory.itemMagnetStock += obj_inventory.itemMagnetAdd
									obj_control_ui.newLine = "YOU PICKED UP SOME MAGNETS."
									break		
								case ITEM.BOMB:
									obj_inventory.itemBomb = true
									obj_inventory.itemBombStock += obj_inventory.itemBombAdd
									obj_control_ui.newLine = "YOU PICKED UP SOME BOMBS."
									break								
							}
							// reset
							
						}
						if searchTarget.weapon != WEAPON.NONE
						{
							switch searchTarget.weapon
							{
								case WEAPON.PISTOL:
									obj_inventory.hasWeaponPistol = true
									obj_inventory.weaponPistolAmmo += obj_inventory.weaponPistolAdd
									obj_control_ui.newLine = "YOU PICKED UP A PISTOL."
									break
								case WEAPON.PLASMA:
									obj_inventory.hasWeaponPlasma = true
									obj_inventory.weaponPlasmaAmmo += obj_inventory.weaponPlasmaAdd
									obj_control_ui.newLine = "YOU PICKED UP A PLASMA GUN."
									break
							}
							searchTarget.weapon = WEAPON.NONE
						}
					}
				}
				// if it HAS been searched
				else
				{
					if searchTarget.object_index != obj_env_switch
					{
						obj_control_ui.newLine = "ALREADY SEARCHED."
					}
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
		
		// find push target
		else if obj_input.toggle_push
		{
			if pushTarget != noone
			{
				pushTarget = noone
				facing = pushDir
			}
			else
			{
				pushDir = facing
				pushTarget = instance_place(x + xReach, y + yReach, obj_parent_solid)
				if pushTarget != noone
				{
					if !pushTarget.canMove
					{
						pushTarget = noone
					}
				}
			}
		}
		
		// set direction regardless if you can progress or not
		if obj_input.move_right_press
		{
			facing = DIR.RIGHT
			if !obj_main.tick
			{
				storeMove = OFF_MOVE.RIGHT
			}
		}
		else if obj_input.move_up_press
		{
			facing = DIR.UP
			if !obj_main.tick
			{
				storeMove = OFF_MOVE.UP
			}				
		}
		else if obj_input.move_left_press
		{
			facing = DIR.LEFT
			if !obj_main.tick
			{
				storeMove = OFF_MOVE.LEFT
			}				
		}
		else if obj_input.move_down_press
		{
			facing = DIR.DOWN
			if !obj_main.tick
			{
				storeMove = OFF_MOVE.DOWN
			}				
		}			
		// not pressing any buttons
		if !obj_input.moveRightHold and !obj_input.moveUpHold and !obj_input.moveLeftHold and !obj_input.moveDownHold
		{
			// frame 1 with legs together to appear standing
			image_index = 1
			switchBeginMove = true
		}
		else
		{
			// take first step
			if switchBeginMove
			{
				switchBeginMove = false
				//reset frame to moving again
				image_index = 0
			}
		}
		// change walking sprite based on direction
		if obj_inventory.currentWeapon != WEAPON.UNARMED
		{
			if shootTurnTimer == 0
			{
				if facing == DIR.RIGHT
				{
					sprite_index = s_vic_right_sRight
				}
				else if facing == DIR.UP
				{
					sprite_index = s_vic_up_sUp
				}
				else if facing == DIR.LEFT
				{
					sprite_index = s_vic_left_sLeft
				}
				else if facing == DIR.DOWN
				{
					sprite_index = s_vic_down_sDown
				}
			}
		}	
		// a tick happens every 10ms 
		if obj_main.tick
		{
			/* if you hold a direction during a tick or had moved during no tick(OFF_MOVE), move the player */
			if obj_input.moveRightHold or storeMove == OFF_MOVE.RIGHT
			{
				// delete stored move
				storeMove = OFF_MOVE.NONE
				// set reach for current direction
				reach(facing)
				// actually moves the player with or without object to push
				move_push(facing, id, pushTarget, xReach, yReach)
			}
			else if obj_input.moveUpHold or storeMove == OFF_MOVE.UP
			{
				storeMove = OFF_MOVE.NONE
				reach(facing)
				move_push(facing, id, pushTarget, xReach, yReach)		
			}
			else if obj_input.moveLeftHold or storeMove == OFF_MOVE.LEFT
			{
				storeMove = OFF_MOVE.NONE
				reach(facing)
				move_push(facing, id, pushTarget, xReach, yReach)		
			}				
			else if obj_input.moveDownHold or storeMove == OFF_MOVE.DOWN
			{
				storeMove = OFF_MOVE.NONE
				reach(facing)
				move_push(facing, id, pushTarget, xReach, yReach)			
			}
		}
		#region SHOOTING
		// tick down shoot turn timer
		if shootTurnTimer > 0
		{
			shootTurnTimer--
		}
		
		// shooting
		if obj_inventory.currentWeapon != WEAPON.UNARMED
		{
			// shooting directions
			if obj_input.shoot_up_press
			{
				player_shoot(DIR.UP, obj_inventory.currentWeapon)
			}
			else if obj_input.shoot_down_press
			{
				player_shoot(DIR.DOWN, obj_inventory.currentWeapon)
			}
			else if obj_input.shoot_left_press
			{
				player_shoot(DIR.LEFT, obj_inventory.currentWeapon)
			}
			else if obj_input.shoot_right_press
			{
				player_shoot(DIR.RIGHT, obj_inventory.currentWeapon)
			}
		}
		#endregion
	}
	else
	{
		teleport = false //reset
		obj_main.levelClear = "fail"
		if deathTimer == deathTimerMax
		{
			deathTimer = 0
			obj_main.gameMode = GAMEMODE.STATUS
			room = room_status
		}
		else
		{
			deathTimer++ 
		}
		if hp < -75
		{
			if gibSwitch
			{
				gibSwitch = false
				instance_create_depth(x, y, bulletDepth, obj_effect_explosion)
				// sprite_index = spr_empty
			}
		}
		else
		{
			sprite_index = spr_player_vic_dead
		}
	}
}