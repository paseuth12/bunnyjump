extends KinematicBody2D

var motion = Vector2(0 , 100)
export var speed = 500

func _physics_process(delta):

	if Input.is_action_pressed("left"):
		motion.x = -speed
	elif Input.is_action_pressed("right"):
		motion.x = +speed
	elif Input.is_action_just_pressed("jump"):
		motion.y = -speed
	elif Input.is_action_just_released("jump"):
		motion.y = +speed
	else:
		motion.x = 0
		
	move_and_slide(motion)
	