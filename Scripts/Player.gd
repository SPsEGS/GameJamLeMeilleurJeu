extends CharacterBody2D

class_name Player

@export var speed : float = 80000
@export var gravity : float = 3000
@export var jump_impulse : float = 1000
@export var can_jump : bool = true
var playerNb : String;

var direction : float = 0
var has_jumped : bool = false


func input_loop() :
	direction = int(Input.is_action_pressed(playerNb + "_mv_right")) - int(Input.is_action_pressed(playerNb + "_mv_left"))
	if(Input.is_action_pressed(playerNb + "_jump") and is_on_floor() and !has_jumped):
		jump()

func move(delta) :
	velocity.x = direction * speed * delta
	velocity.y += gravity * delta
	move_and_slide()
	if(is_on_floor()):
		has_jumped = false

func jump():
	if (can_jump) :
		velocity.y = -jump_impulse
		has_jumped = true

func _process(delta):
	input_loop()
	move(delta)
