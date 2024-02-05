if instance_exists(controller)
{
	if controller.active
	{
		if currentBridgeLength < maxBridgeLength
		{
			if timer != timerMax
			{
				timer++
			}
			else
			{
				timer = 0
				var target = instance_create_depth(x+16, y - 16 - (counterChunk*16), depth, obj_env_autoBridge_chunk)
				bridgeArray[counterChunk] = target
				if counterChunk < maxBridgeLength
				{
					counterChunk++
				}
			}
		}
	}
	if !controller.active
	{
		if counterChunk > 0
		{
			if timer != timerMax
			{
				timer++
			}
			else
			{
				timer = 0
								counterChunk--
				instance_destroy(bridgeArray[counterChunk])

			}
		}
	}
}

//if active
//{
//	if toggleBuild
//	{
//		for (var i = 0; i < currentBridgeLength; i++)
//		{

//			if i == currentBridgeLength
//			{
//				toggleBuild = false
//			}
//		}
		
//	}
//}