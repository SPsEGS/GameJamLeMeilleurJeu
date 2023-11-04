extends Player

var crouching : bool = false
var speed_crouching = speed / 2
var reel_speed = speed

@onready var _animation_player = $AnimationPlayer

func ready():
	playerNb = "p1"

func input_loop() :
	direction = int(Input.is_action_pressed("p1_mv_right")) - int(Input.is_action_pressed("p1_mv_left"))
	if(Input.is_action_pressed("p1_jump") and is_on_floor() and !has_jumped and !crouching):
		jump()
	if (Input.is_action_just_pressed("p1_crouch") and is_on_floor()) :
		if(!crouching) :
			crouch()
			crouching = true
		else :
			speed = reel_speed
			crouching = false
			_animation_player.play("un_crouching")
	if (Input.is_action_just_pressed("p1_interact")) :
		interact()

func crouch() :
	speed = speed_crouching
	_animation_player.play("crouching")
	
func interact() :
	pass
