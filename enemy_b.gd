extends CharacterBody2D

@onready var player_location = get_node("/root/Node2D/Node2D/player")
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var is_player_in_detection_zone = false
var target:Vector2
var is_on_cooldown = false
var is_dashing = false
var overshoot = Vector2(10,0)
var is_alive = true

func _physics_process(delta: float) -> void:
	if is_alive:
		if is_player_in_detection_zone == true and is_on_cooldown == false :#attack
		
			look_at(player_location.global_position)
			target = player_location.global_position + overshoot
			#the attack itself
			is_dashing = true
			#end of attack
			is_on_cooldown= true
			%"cool down".start()
		
		%dash_effect.rotation_degrees = rotation_degrees
		if is_dashing ==true :
			%animations.play("rush")
			%dash_effect.emitting = true
			global_position = global_position.move_toward(target,Global.speed *delta*250)
		elif is_dashing == false and is_player_in_detection_zone == true:
			%animations.play("activated")
			%dash_effect.emitting = false
		elif is_dashing == false and is_player_in_detection_zone == false:
			%animations.play("idle")
			%dash_effect.emitting = false
		if global_position == target:
			is_dashing= false
	
func _on_detection_zone_body_entered(body: Node2D) -> void:
	if "player" in str(body):#detects player
		is_player_in_detection_zone= true
func _on_detection_zone_body_exited(body: Node2D) -> void:
	if "player" in str(body):#forgets player
		is_player_in_detection_zone= false
func _on_damage_intake_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):#gets hit by player
		is_alive = false
		$CPUParticles2D.emitting = true
		$walls_no_clip_avoidance.hide()
		%dash_effect.hide()
		$actual_faceplate.hide()
		$damage_dealer.hide()
		$damage_intake.hide()
		%animations.hide()
		%death_delay.start()
		if Global.hp < 4:
			Global.hp+= 0.5
func _on_cool_down_timeout() -> void:
	is_on_cooldown = false
func _on_walls_no_clip_avoidance_body_entered(body: Node2D) -> void:#to try to make the enemy stop when hits a wall
	if "TileMapLayer" in str(body):#gets hit by wall
		is_dashing = false
func _on_death_delay_timeout() -> void:#death
	queue_free()

#parte do codigo que eu fiz qualquer coisa vc reorganiza
func _on_damage_dealer_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and is_alive == true :
		Global.hp -= 1
		print(Global.hp)
