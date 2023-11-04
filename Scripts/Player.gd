extends CharacterBody2D

class_name Player

var direction : float = 0

var SPEED : float = 1000

func input_loop() :
	
	direction = int(Input.is_action_pressed("p1_mv_right")) - int(Input.is_action_pressed("p1_mv_left"))
	
func move(delta) :
	
	velocity.x = direction * SPEED * delta
	velocity.y = 0
	move_and_slide()

func _process(delta):
	input_loop()
	move(delta)
