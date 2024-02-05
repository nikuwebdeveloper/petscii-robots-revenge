function func_text_outline(xx,yy,text, textColor, outlineColor)
{
	draw_text_color(xx+1,yy,text,outlineColor,outlineColor,outlineColor,outlineColor,1);
	draw_text_color(xx,yy+1,text,outlineColor,outlineColor,outlineColor,outlineColor,1);
	draw_text_color(xx-1,yy,text,outlineColor,outlineColor,outlineColor,outlineColor,1);
	draw_text_color(xx,yy-1,text,outlineColor,outlineColor,outlineColor,outlineColor,1);
	draw_text_color(xx,yy,text,textColor,textColor,textColor,textColor,1);
}
function func_draw_corner()
{
	if place_meeting(x+16, y, obj_env_wall)
	{
		draw_sprite(spr_wall_full_0,0,x-8,y-8)
	}
	if place_meeting(x, y+16, obj_env_wall)
	{
		draw_sprite(spr_wall_full_1,0,x-8,y-8)
	}
}