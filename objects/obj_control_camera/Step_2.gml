cameraX = camera_get_view_x(view_camera[0])
cameraY = camera_get_view_y(view_camera[0])

viewCenterX = camera_get_view_width(view_camera[0])/2-36
viewCenterY = camera_get_view_height(view_camera[0])/2-28

if instance_exists(obj_player_vic)
{
	camera_set_view_pos(view_camera[0], obj_player_vic.x-viewCenterX, obj_player_vic.y-viewCenterY);
}