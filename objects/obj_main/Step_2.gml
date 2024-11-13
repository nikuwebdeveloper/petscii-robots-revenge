if gameMode == GAMEMODE.GAMEPLAY
{
	if timerClock == clock
	{
		// tick is period of time where actions happen
		tick = true
		timerClock = 0
	}
	else
	{
		timerClock++;
		tick = false
	}
}

#region CAMERA
cameraX = camera_get_view_x(view_camera[0])
cameraY = camera_get_view_y(view_camera[0])

viewCenterX = (camera_get_view_width(view_camera[0]) / 2) - 36
viewCenterY = (camera_get_view_height(view_camera[0]) / 2) - 28
#endregion