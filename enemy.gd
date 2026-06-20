extends CharacterBody2D
@onready var locate = get_node("/root/Node2D/Node2D/player")
var player = null
var player_chase= false
var velocidade = 50
var timer = false
func _physics_process(delta: float) -> void:
	if player_chase == true :
		global_position = global_position.move_toward(locate.global_position, velocidade * delta)
	if timer ==  true:
		velocidade = 150
	else:
		velocidade = 50
func _on_detection_body_entered(body) -> void:
	player = body
	player_chase= true

func _on_detection_body_exited(body) -> void:
	player=null
	player_chase=false


func _on_damage_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_rush_timeout() -> void:
	timer = !timer
