extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var current_direction = rotation


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("mouse_left"):
		rotation+=0.1
		Global.speed=0.2
		
	else: 
		Global.speed=1
		position += transform.y * SPEED * delta*-1* Global.speed
	if Input.is_action_just_released("mouse_left"):
		#print(self.get_rotation() )
		pass
	

	
	move_and_slide()
