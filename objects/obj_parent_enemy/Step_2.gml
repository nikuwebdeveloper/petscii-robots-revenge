event_inherited();
//set direction
if x == xprevious and y < yprevious
{
	facing = DIR.UP;
}
else if x == xprevious and y > yprevious
{
	facing = DIR.DOWN;
}

if x > xprevious and y == yprevious
{
	facing = DIR.RIGHT;
}
else if x < xprevious and y == yprevious
{
	facing = DIR.LEFT;
}
// //move enemy to free space if on top of another enemy
// if x == xprevious and y == yprevious and obj_main.tick //if still during tick
// {
// 	var numInstances = instance_number(obj_parent_enemy);
// 	for (var i = 0; i < numInstances; i++) 
// 	{
// 		var instance = instance_find(obj_parent_enemy, i);
// 		if instance != id //not me
// 		{
// 			if x == instance.x and y == instance.y //on top of another instance
// 			{
// 				var rand = irandom_range(0,3);
// 				var xx = 0;
// 				var yy = 0;
// 				if rand == 0
// 				{
// 					yy = -8;
// 				}
// 				else if rand == 1
// 				{
// 					yy = 8;
// 				}
// 				else if rand == 2
// 				{
// 					xx = -8
// 				}
// 				else if rand == 3
// 				{
// 					xx = 8
// 				}	
// 				if place_empty(x+xx, y+yy,obj_parent_solid)
// 				{
// 					x = x+xx;
// 					y = y+yy;
// 				}
// 			}
// 		}
// 	}
// }
