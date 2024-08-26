draw_self();
//draw_line(bbox_left,bbox_top, bbox_left, bbox_bottom)
//draw_line(bbox_right,bbox_top, bbox_right, bbox_bottom)
//draw_line(bbox_right,bbox_top, bbox_left, bbox_top)
//draw_line(bbox_right,bbox_bottom, bbox_left, bbox_bottom)
if label
{
	draw_text(x,y,"ME")
}
if object_index != obj_env_wall
{
	draw_corner()
}