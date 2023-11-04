extends CharacterBody2D

class_name Player

var direction : float = 0

var SPEED : float

func input_loop() :
	
	direction = int(Input.is_action_pressed("p1_mv_right")) - int(Input.is_action_pressed("p1_mv_left"))
	
func move() :
	
	
	move_and_slide(direction*SPEED)
