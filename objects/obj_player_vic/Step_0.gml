event_inherited()
if obj_main.gameMode == GAMEMODE.GAMEPLAY
{
	if alive
	{
		reach(facing)
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
		
		// search for item
		if global.input.search
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
		
		// find push target
		else if global.input.toggle_push
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
			// take first step
			if switchBeginMove
			{
				switchBeginMove = false
				//reset frame to moving again
				image_index = 0
			}
		}
		// change walking sprite based on direction
		if global.currentWeapon!= WEAPON.UNARMED
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
			//obj_ui.x = obj_player_vic.x - obj_main.viewCenterX;
			//obj_ui.y = obj_player_vic.y - obj_main.viewCenterY;

			if global.currentWeapon == WEAPON.UNARMED
			{
				// sets sprite to unarmed array of directional sprites
				obj_player_vic.sprite_index = obj_player_vic.spriteDir.unarmed[obj_player_vic.facing][facing]

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
			// move camera to follow player
			camera_set_view_pos(view_camera[0], obj_player_vic.x - obj_main.viewCenterX, obj_player_vic.y - obj_main.viewCenterY);
		}
		#region SHOOTING
		// tick down shoot turn timer
		if shootTurnTimer > 0
		{
			shootTurnTimer--
		}
		
		// shooting
		if global.currentWeapon!= WEAPON.UNARMED
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