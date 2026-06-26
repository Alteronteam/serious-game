extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -400.0
var current_direction = rotation
var buffer_started = false
func _physics_process(delta: float) -> void:
	if Global.is_on_buffer == true and buffer_started == false:
		%damage_sfx.play()
		$damage_buffer.start()
		buffer_started = true
	print(Global.is_on_buffer)
	$buffer_sprite.play(str(Global.is_on_buffer))
	
	
	if Input.is_action_pressed("mouse_left"):
		Global.slowmo = true
		$AnimatedSprite2D.play("hold")
		scale.y = lerp(0.8,1.0,0.05)
		rotation+=0.1
		Global.speed=0.1
		velocity = Vector2.ZERO 
		
		
	else: 
		Global.speed=1
		position += transform.y * SPEED * delta*-1 * Global.speed
		
	if Input.is_action_just_pressed("mouse_left"):
		%click_sfx.play()
	
	if Input.is_action_just_released("mouse_left"):
		Global.slowmo = false
		%release_sfx.play()
		$AnimatedSprite2D.play("moving")
		scale.y = lerp(1.0,0.8,0.05*delta)
		#play sound
		
	
	move_and_slide()

	
	if Global.hp <= 0:
		get_tree().change_scene_to_file("res://game_over.tscn")


func _on_damage_dealer_area_entered(area: Area2D) -> void:
	print("colidiu com: ", area.name, " | grupos: ", area.get_groups())


func _on_damage_dealer_body_entered(body: Node2D) -> void:
	print("colidiu com: ", body.name, " | grupos: ", body.get_groups())
	if body.is_in_group("next_level"):
		
		$CanvasLayer/screen_transition.play("default")
		Next()

func Next():
	Global.levels += 1
	Global.hp = 4.0
	match Global.levels:
		1:
			get_tree().change_scene_to_file("res://world_2.tscn")
		2:
			get_tree().change_scene_to_file("res://world_3.tscn")
		3:
			get_tree().change_scene_to_file("res://world_4.tscn")
		#4:
			#get_tree().change_scene_to_file("res://world_5.tscn")
func _on_ambient_damage_body_entered(body: Node2D) -> void:
	if "TileMapLayer" in str(body) and Global.is_on_buffer == false :
		Global.hp -=0.5
		Global.is_on_buffer = true
func _on_damage_buffer_timeout() -> void:
	Global.is_on_buffer = false
	buffer_started = false
