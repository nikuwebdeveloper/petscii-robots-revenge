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