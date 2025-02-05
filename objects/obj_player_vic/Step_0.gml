event_inherited()
if obj_main.gameMode == GAMEMODE.GAMEPLAY
{
	// calculate reach in-front of player based on facing direction
	reach(facing)
	if alive
	{
		// check if dead
		if hp <= 0
		{
			dead = true
		}
		// adjust bullet 
		if instance_exists(obj_parent_shot_player)
		{	/*FIX THIS*///set bullet depth higher than the lowest y position for y = - y - x
			bulletDepth = - 3299 
		}
		
		#region PLAYER ACTIONS
		// use item in inventory
		if global.input.use
		{
			if global.currentItem == ITEM.MEDKIT
			{
				// if injured
				if (hp < 100) and (global.inventory.medkit.stock > 0)
				{
					if (hp + global.inventory.medkit.stock) >= 100
					{
						// overflow
						global.inventory.medkit.stock = hp + global.inventory.medkit.stock - 100
						hp = 100
					}
					//use up what you have to heal
					else
					{
						hp += global.inventory.medkit.stock
						global.inventory.medkit.stock = 0
					}
				}
			}
			else if global.currentItem == ITEM.BOMB
			{
				if global.inventory.bomb.stock> 0
				{
					instance_create_depth(x + xReach, y + yReach, depth, obj_deployable_bomb)
					global.inventory.bomb.stock--
				}
			}
			else if global.currentItem == ITEM.MAGNET
			{
				if global.inventory.magnet.stock > 0
				{
					instance_create_depth(x + xReach, y + yReach, depth, obj_deployable_magnet)
					global.inventory.magnet.stock--
				}
			}
			else if global.currentItem == ITEM.EMP
			{
				if global.inventory.emp.stock > 0
				{
					instance_create_depth(x + xReach, y + yReach, depth, obj_deployable_emp)
					global.inventory.emp.stock--
				}
			}
			else if global.currentItem == ITEM.NONE
			{
				obj_ui.newLine = "YOU HAVE NO ITEM SELECTED."
			}
		}
		
		// search for item near player
		if global.input.search
		{
			instance_create_depth(x + xReach * 2, y + yReach*2, depth + 16, obj_selectorCube)
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
						obj_ui.newLine = "NOTHING THERE."
					}
					// has something
					else
					{
						// if it has an item
						if searchTarget.item != ITEM.NONE
						{
							switch searchTarget.item
							{
								//FIX! need to prevent overflow
								case ITEM.MEDKIT:
									global.inventory.medkit.acquired = true
									global.inventory.medkit.stock += global.inventory.medkit.add;
									obj_ui.newLine = "YOU PICKED UP A MEDKIT."
									break		
								case ITEM.EMP:
									global.inventory.emp.acquired = true
									global.inventory.emp.stock += global.inventory.emp.add;
									obj_ui.newLine = "YOU PICKED UP SOME EMPS."
									break		
								case ITEM.MAGNET:
									global.inventory.magnet.acquired = true
									global.inventory.magnet.stock += global.inventory.magnet.add;
									obj_ui.newLine = "YOU PICKED UP SOME MAGNETS."
									break		
								case ITEM.BOMB:
									global.inventory.bomb.acquired = true
									global.inventory.bomb.stock += global.inventory.bomb.add;
									obj_ui.newLine = "YOU PICKED UP SOME BOMBS."
									break								
							}					
						}
						if searchTarget.weapon != WEAPON.NONE
						{
							switch searchTarget.weapon
							{
								case WEAPON.PISTOL:
									global.armory.pistol.acquired = true
									global.armory.pistol.stock += global.armory.pistol.add;
									obj_ui.newLine = "YOU PICKED UP A PISTOL."
									break
								case WEAPON.PLASMA:
									global.armory.plasma.acquired = true
									global.armory.plasma.stock += global.armory.plasma.add;
									obj_ui.newLine = "YOU PICKED UP A PLASMA GUN."
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
						obj_ui.newLine = "ALREADY SEARCHED."
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
		// push object
		if global.input.toggle_push
		{
			if pushTarget == noone
			{
				pushTarget = instance_place(x + xReach, y + yReach, obj_parent_solid)
				// if the object can't be moved, unassign the variable
				if !pushTarget.moveable
				{
					pushTarget = noone
				}
			}
			// acts as a toggle to allow the player to let go of object
			else if pushTarget != noone
			{
				pushTarget = noone
				// turn on boolean to prevent player from automatically turning around to face the direction the last input was
				letGo = true
			}
		}
		
		// MOVEMENT
		// set direction regardless if you can progress or not
		if global.input.move_right_press
		{
			facing = DIR.RIGHT
			if !obj_main.tick
			{
				storeMove = OFF_MOVE.RIGHT
			}
		}
		else if global.input.move_up_press
		{
			facing = DIR.UP
			if !obj_main.tick
			{
				storeMove = OFF_MOVE.UP
			}				
		}
		else if global.input.move_left_press
		{	
			facing = DIR.LEFT
			if !obj_main.tick
			{
				storeMove = OFF_MOVE.LEFT
			}				
		}
		else if global.input.move_down_press
		{
			facing = DIR.DOWN
			if !obj_main.tick
			{
				storeMove = OFF_MOVE.DOWN
			}				
		}			
		// not pressing any buttons
		if !global.input.moveRightHold and !global.input.moveUpHold and !global.input.moveLeftHold and !global.input.moveDownHold
		{
			// frame 1 with legs together to appear standing
			image_index = 1
			switchBeginMove = true
		}
		else
		{
			// resets boolean
			letGo = false
			// take first step
			if switchBeginMove
			{
				switchBeginMove = false
				//reset frame to moving again
				image_index = 0
			}
		}
		// a tick happens every 10ms 
		if obj_main.tick
		{
			if global.currentWeapon == WEAPON.UNARMED
			{
				// sets sprite to unarmed array of directional sprites
				// not pushing an object
				if pushTarget == noone
				{
					// don't change sprite if player just let go of object
					if !letGo
					{
						obj_player_vic.sprite_index = obj_player_vic.spriteDir.unarmed[obj_player_vic.facing][facing]
					}
				}
				// pushing an object
				else
				{
				//	obj_player_vic.sprite_index = obj_player_vic.spriteDir.unarmed[obj_player_vic.facingDir][facingDir]
				}

			}
			/* if you hold a direction during a tick or had moved during no tick(OFF_MOVE), move the player */
			if global.input.moveRightHold or storeMove == OFF_MOVE.RIGHT
			{
				// delete stored move
				storeMove = OFF_MOVE.NONE
				// set reach for current direction
				reach(facing)
				// actually moves the player with or without object to push
				move_push(facing, id, pushTarget, xReach, yReach)
			}
			else if global.input.moveUpHold or storeMove == OFF_MOVE.UP
			{
				storeMove = OFF_MOVE.NONE
				reach(facing)
				move_push(facing, id, pushTarget, xReach, yReach)		
			}
			else if global.input.moveLeftHold or storeMove == OFF_MOVE.LEFT
			{
				storeMove = OFF_MOVE.NONE
				reach(facing)
				move_push(facing, id, pushTarget, xReach, yReach)		
			}				
			else if global.input.moveDownHold or storeMove == OFF_MOVE.DOWN
			{
				storeMove = OFF_MOVE.NONE
				reach(facing)
				move_push(facing, id, pushTarget, xReach, yReach)			
			}
			// set sprite counter to return the player to his original sprite after turning to shoot
			if shootTurnTimer > 0
			{
				shootTurnTimer--
			}
			else
			{
				obj_player_vic.sprite_index = obj_player_vic.spriteDir.pistol[obj_player_vic.facing][facing]
				// this should prevent this code block from running too often ???
				shootTurnTimer = -1
			}

			// move camera to follow player
			camera_set_view_pos(view_camera[0], obj_player_vic.x - obj_main.viewCenterX, obj_player_vic.y - obj_main.viewCenterY);
		}
		
		// shooting
		if global.currentWeapon != WEAPON.UNARMED
		{
			// shooting directions
			if global.input.shoot_up_press
			{
				player_shoot(DIR.UP, global.currentWeapon)
			}
			else if global.input.shoot_down_press
			{
				player_shoot(DIR.DOWN, global.currentWeapon)
			}
			else if global.input.shoot_left_press
			{
				player_shoot(DIR.LEFT, global.currentWeapon)
			}
			else if global.input.shoot_right_press
			{
				player_shoot(DIR.RIGHT, global.currentWeapon)
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