extends Player

class_name Human

var crouching : bool = false
var speed_crouching : float = speed / 2
var reel_speed : float = speed
var hold_object : bool = false
var on_piti_champi : bool = false
var which_mush : Petit_champi

@onready var _animation_player = $AnimationPlayer

func set_on_mushmush(body : Petit_champi) :
	on_piti_champi = true
	which_mush = body
	
func set_off_mushmush() :
	on_piti_champi = false

func _ready() :
	playerNb = "p1"

func input_loop() :
	super()
	if (Input.is_action_just_pressed(playerNb + "_crouch") and is_on_floor()) :
		if(!crouching) :
			crouch()
			crouching = true
		else :
			speed = reel_speed
			crouching = false
			_animation_player.play("un_crouching")

	if (Input.is_action_just_pressed(playerNb + "_interact")) :
		take()

func crouch() :
	speed = speed_crouching
	_animation_player.play("crouching")
	
func take() :
	if (!hold_object and on_piti_champi) :
		hold_object = true
		which_mush.get_parent().remove_child(which_mush)
		add_child(which_mush)
