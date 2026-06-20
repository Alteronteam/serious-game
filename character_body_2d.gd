extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("mouse_left"):
		rotation+=0.1
	else:	
		position += transform.y * SPEED * delta*-1
	
	move_and_slide()
