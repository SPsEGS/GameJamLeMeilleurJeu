extends Area2D

var is_reachable = false

@onready var _animation_champi = $AnimationPlayer

func _process(_delta) :
	if (is_reachable && Input.is_action_just_pressed("p1_interact")) :
		_animation_champi.play("flash")





func _on_body_entered(_body):
	is_reachable = true


func _on_body_exited(_body):
	is_reachable = false
