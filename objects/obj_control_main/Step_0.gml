if gameMode == "gameplay"
{
	if timerClock == clock
	{
		tick = true;
		timerClock = false;
		show_debug_message("tick")
	}
	else
	{
		timerClock++;
		tick = false;
	}
}