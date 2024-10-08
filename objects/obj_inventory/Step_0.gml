if totalItemNum <= 4 
{
	if hasItemMedkit and itemHealthPackSwitch
	{
		itemHealthPackSwitch = false;
		totalItemNum++;
	}
	if itemEmp and itemEmpSwitch
	{
		itemEmpSwitch = false;
		totalItemNum++;
	}
	if itemMagnet and itemMagnetSwitch
	{
		itemMagnetSwitch = false;
		totalItemNum++;
	}
	if itemBomb and itemBombSwitch
	{
		itemBombSwitch = false;
		totalItemNum++;
	}
}