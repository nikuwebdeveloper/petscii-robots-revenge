event_inherited();
if timer == maxTimer or place_meeting(x,y,obj_effect_explosion_damage)
{
	func_explosion("bomb")
	instance_destroy();
}
else
{
	timer++;
}