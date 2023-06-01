if obj_control_main.gameMode == "gameplay"
{
	if currentItemPos < 3
	{
		if obj_control_input.input_item_right
		{
			currentItemPos++;
		}
	}
	if currentItemPos > 0
	{
		if obj_control_input.input_item_left
		{
			currentItemPos--;
		}
	}
}