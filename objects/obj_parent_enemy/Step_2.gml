if x == xprevious and y < yprevious
{
	dir = "up";
}
else if x == xprevious and y > yprevious
{
	dir = "down";
}

if x > xprevious and y == yprevious
{
	dir = "right";
}
else if x < xprevious and y == yprevious
{
	dir = "left";
}