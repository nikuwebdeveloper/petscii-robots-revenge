if timerDie > 0
{
	timerDie--
}
else
{
	instance_destroy();
}

if timerSpawn > 0
{
	timerSpawn--
}
else
{
	timerSpawn = timerSpawnMax
	randDir = irandom(3)
	
}