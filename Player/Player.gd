extends KinematicBody2D

var motion = Vector2(0 , 100)

export var speed = 300
export var gravity = 25
export var jump_power = 600

func _physics_process(delta):
	move_and_slide(motion, Vector2( 0,-1))
	apply_gravity()
	jump()
	walk()
	
func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y = motion.y + gravity

func jump():
		if Input.is_action_just_pressed("jump"):
			motion.y = -jump_power
func walk():

	if Input.is_action_pressed("left"):
		motion.x = -speed
	elif Input.is_action_pressed("right"):
		motion.x = +speed

		motion.y = +speed
	else:
		motion.x = 0
		
	move_and_slide(motion)
	