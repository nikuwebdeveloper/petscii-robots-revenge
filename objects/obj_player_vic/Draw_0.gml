event_inherited();
//draw_sprite(spr_mask_square_16x16,0,x,y);
draw_self();
func_draw_corner()


if place_meeting(x,y,obj_hazard) and !place_meeting(x,y,obj_env_autoBridge_chunk)
{
	var xx = 0
	var yy = 0
	if dir == "up"
	{
		//y-= 16
	}
	else if dir == "down"
	{
		yy = 16
	}
	else if dir == "left"
	{
		xx  = 16
		yy = 0
	}
	else if dir == "right"
	{
		yy = 16
		xx = 0
	}
	draw_sprite(spr_env_autoBridge_chunk,0,hazardFallObj.x+xx, hazardFallObj.y+yy)
}
//draw_text(x,y,hp);
//draw_text(x,y,depth);