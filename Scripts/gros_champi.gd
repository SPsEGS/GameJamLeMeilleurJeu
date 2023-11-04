extends Area2D

var is_reachable = false
var who

@onready var _animation_champi = $AnimationPlayer

func _process(_delta) :
	var player := who as Human
	if (player) :
		if (is_reachable && Input.is_action_just_pressed("p1_interact") and player.can_interact()) :
			_animation_champi.play("flash")

func _on_body_entered(body):
	who = body
	is_reachable = true


func _on_body_exited(_body):
	is_reachable = false
