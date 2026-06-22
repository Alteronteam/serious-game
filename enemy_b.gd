extends CharacterBody2D

@onready var player_location = get_node("/root/Node2D/Node2D/player")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var is_player_in_detection_zone = false
var target:Vector2
var is_on_cooldown = false

func _physics_process(delta: float) -> void:
	if is_player_in_detection_zone == true and is_on_cooldown == false :#attack
		
		look_at(player_location.global_position)
		target = player_location.global_position
		#attack itself
		global_position = global_position.move_toward(target, Global.speed * delta)
		
		#end of attack
		is_on_cooldown= true
		%"cool down".start()
	
func _on_detection_zone_body_entered(body: Node2D) -> void:
	print(body)
	if "player" in str(body):# para saber que é o player
		is_player_in_detection_zone= true
func _on_detection_zone_body_exited(body: Node2D) -> void:
	if "player" in str(body):
		is_player_in_detection_zone= false
func _on_damage_intake_area_entered(area: Area2D) -> void:
	if "damage_dealer" in str(area):
		$CPUParticles2D.emitting = true
		queue_free()
func _on_cool_down_timeout() -> void:
	is_on_cooldown = false
