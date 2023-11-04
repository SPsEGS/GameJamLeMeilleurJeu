extends Player

class_name Alien

@export var grapple_max_distance = 10000

@onready var raycast : RayCast2D = get_node("GrappleRaycast")
@onready var grapple_line : Line2D = get_node("GrappleLine")

var grapple_point : Vector2
var grapple_is_attached : bool = false

func _ready():
	playerNb = "p2"

	grapple_line.hide()
	grapple_line.add_point(Vector2.ZERO)
	grapple_line.add_point(Vector2.ZERO)


func input_loop():
	super()
	var grapple_direction : Vector2
	grapple_direction = Input.get_vector("p2_grapple_left", "p2_grapple_right",
										 "p2_grapple_up", "p2_grapple_down").normalized()

	if Input.is_action_just_pressed("p2_grapple_throw"):
		if !grapple_direction.is_zero_approx():
			raycast.target_position = grapple_direction * grapple_max_distance
			raycast.force_raycast_update()

			if(raycast.is_colliding()):
				grapple_point = raycast.get_collision_point()
				grapple_throw()
	
	if(Input.is_action_just_released("p2_grapple_throw")):
		grapple_line.hide()


func grapple_throw():
	grapple_line.set_point_position(1, grapple_point - position)
	grapple_line.show()
	grapple_is_attached = true

func grapple_release():
	grapple_line.hide()
	grapple_is_attached = false

func grapple_move():

func _process(delta):
	super(delta)
	grapple_line.set_point_position(1, grapple_point - position)
