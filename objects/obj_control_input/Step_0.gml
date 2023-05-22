//inputs
input_escape = keyboard_check_pressed(vk_escape);
input_restart = keyboard_check_pressed(vk_f1);

//move press
input_move_up_press = keyboard_check_pressed(ord("W"));
input_move_down_press = keyboard_check_pressed(ord("S"));
input_move_left_press = keyboard_check_pressed(ord("A"));
input_move_right_press = keyboard_check_pressed(ord("D"));

//move hold
input_move_up_hold = keyboard_check(ord("W"));
input_move_down_hold = keyboard_check(ord("S"));
input_move_left_hold = keyboard_check(ord("A"));
input_move_right_hold = keyboard_check(ord("D"));

//user actions
//quit game
if input_escape
{
	game_end();
}
//restart game
if input_restart
{
	game_restart();
}
