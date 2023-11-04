extends Player

class_name Human

var crouching : bool = false
var speed_crouching : float = speed / 2
var reel_speed : float = speed
var hold_object : bool = false
var on_piti_champi : bool = false
var which_mush : Petit_champi
var baby_mush : Node
var mush_parent

@onready var _animation_player = $AnimationPlayer

func anim_hand() :
	_animation_player.play("hand_up")

func can_interact() :
	return (!hold_object and !crouching)

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

	if (hold_object and Input.is_action_just_pressed(playerNb + "_interact")) :
		throw_mush()

	if (Input.is_action_just_pressed(playerNb + "_interact")) :
		take()
	
	

func crouch() :
	speed = speed_crouching
	_animation_player.play("crouching")
	
func take() :
	if (!hold_object and on_piti_champi) :
		hold_object = true
		mush_parent = which_mush.get_parent()
		(which_mush.get_parent()).remove_child(which_mush)
		add_child(which_mush)
		which_mush.set_owner(self)
		use_mush()

func use_mush() :
	which_mush.show()
	which_mush.position.x = 50
	which_mush.position.y = -50
	
func throw_mush() :
	remove_child(which_mush)
	mush_parent.add_child(which_mush)
	hold_object = false
