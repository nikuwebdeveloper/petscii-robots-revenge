function text_outline(xx,yy,text, textColor, outlineColor)
{
	// draw_text_color(xx+1,yy,text,outlineColor,outlineColor,outlineColor,outlineColor,1);
	// draw_text_color(xx,yy+1,text,outlineColor,outlineColor,outlineColor,outlineColor,1);
	// draw_text_color(xx-1,yy,text,outlineColor,outlineColor,outlineColor,outlineColor,1);
	// draw_text_color(xx,yy-1,text,outlineColor,outlineColor,outlineColor,outlineColor,1);
	draw_text_color(xx,yy,text,textColor,textColor,textColor,textColor,1);
}
function draw_corner()
{
	if spriteCardboard.downFullStepCenter
	{
		draw_sprite(spr_wall_full_1, 0, x - 8, y - 8)
	}
}