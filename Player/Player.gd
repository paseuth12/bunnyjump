extends KinematicBody2D

var motion = Vector2(0 , 100)
var jump_count = 1

export var speed = 300
export var gravity = 25
export var jump_power = 600


func _physics_process(delta):
	walk()
	move_and_slide(motion, Vector2( 0,-1))
	apply_gravity()
	jump()
	
	
func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y = motion.y + gravity

func jump():
	if jump_count < 1:
	
		if Input.is_action_just_pressed("jump"):
			motion.y = -jump_power
			jump_count = jump_count+1
	if is_on_floor():
		jump_count = 0
		
func walk():

	if Input.is_action_pressed("left"):
		motion.x = -speed
	elif Input.is_action_pressed("right"):
		motion.x = +speed
	else:
		motion.x = 0
		
	move_and_slide(motion)
	