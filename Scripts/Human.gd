extends Player

var crouching : bool = false
var speed_crouching = speed / 2
var reel_speed = speed

func input_loop() :
	super()
	if (Input.is_action_just_pressed("p1_crouch")) :
		if(!crouching) :
			crouch()
			crouching = true
		else :
			speed = reel_speed
			crouching = false
			
	
	

func crouch() :
	speed = speed_crouching
