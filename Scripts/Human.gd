extends Player

var crouching : bool = false
var speed_crouching = speed / 2
var reel_speed = speed

@onready var _animation_player = $AnimationPlayer

func _ready():
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
		interact()

func crouch() :
	speed = speed_crouching
	_animation_player.play("crouching")
	
func interact() :
	pass
