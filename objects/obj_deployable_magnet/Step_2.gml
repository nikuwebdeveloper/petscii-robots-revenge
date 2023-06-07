if !broken
{
	if instance_exists(target)
	{
		if target.confuseTimer == target.confuseTimerMax
		{
			broken = true;
		}
		else
		{
			depth = target.depth - 1;
			x = target.x;
			y = target.y;
		}
	}
}