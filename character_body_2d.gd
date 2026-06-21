extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var current_direction = rotation


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("mouse_left"):
		scale.y = lerp(0.8,1.0,0.05)
		rotation+=0.1
		Global.speed=0.1
		
	else: 
		Global.speed=1
		position += transform.y * SPEED * delta*-1* Global.speed
	if Input.is_action_just_released("mouse_left"):
		scale.y = lerp(1.0,0.8,0.05*delta)
		#play sound
		pass
	

	
	move_and_slide()
