//inputs
escape = keyboard_check_pressed(vk_escape);
restart = keyboard_check_pressed(vk_f1);

//////Android code
//// Horizontal movement
//var hInput = gamepad_axis_value(0, gp_axislh); // Get horizontal input from virtual joystick
//if (hInput > 0)
//{
//    x += moveSpeed; // Move right
//}
//else if (hInput < 0)
//{
//    x -= moveSpeed; // Move left
//}

//// Vertical movement
//var vInput = gamepad_axis_value(0, gp_axislv); // Get vertical input from virtual joystick
//if (vInput > 0)
//{
//    y += moveSpeed; // Move down
//}
//else if (vInput < 0)
//{
//    y -= moveSpeed; // Move up
//}

//move press

move_up_press = keyboard_check_pressed(ord("W"));
move_down_press = keyboard_check_pressed(ord("S"));
move_left_press = keyboard_check_pressed(ord("A"));
move_right_press = keyboard_check_pressed(ord("D"));

//prevents diagonals
if move_up_press
{
	move_down_press = false;
	move_right_press = false;
	move_left_press = false;
}
else if move_right_press
{
	move_down_press = false;
	move_left_press = false;
	move_up_press = false;
}
else if move_down_press
{
	move_up_press = false;
	move_right_press = false;
	move_left_press = false;
}
else if move_left_press
{
	move_up_press = false;
	move_right_press = false;
	move_down_press = false;
}

//move hold
moveUpHold = keyboard_check(ord("W"));
moveDownHold = keyboard_check(ord("S"));
moveLeftHold = keyboard_check(ord("A"));
moveRightHold = keyboard_check(ord("D"));

//player_actions
toggle_push = keyboard_check_pressed(ord("F"))
use = keyboard_check_pressed(ord("E"))
search = keyboard_check_pressed(ord("Q"))
item_right = keyboard_check_pressed(ord("L"))
item_left = keyboard_check_pressed(ord("K"))
weapon_right = keyboard_check_pressed(ord("P"))
weapon_left = keyboard_check_pressed(ord("O"))

//shooting
shoot_up_press = keyboard_check_pressed(vk_up)
shoot_down_press = keyboard_check_pressed(vk_down)
shoot_left_press = keyboard_check_pressed(vk_left)
shoot_right_press = keyboard_check_pressed(vk_right)


//options
f9 = keyboard_check_pressed(vk_f9)

//quit game
if escape
{
	game_end();
}
//restart game
if restart
{
	game_restart();
}