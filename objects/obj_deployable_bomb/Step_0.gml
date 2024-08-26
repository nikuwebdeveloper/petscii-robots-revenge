event_inherited();
if timer == maxTimer or place_meeting(x,y,obj_effect_explosion_damage)
{
	explosion("bomb")
	instance_destroy();
}
else
{
	timer++;
}