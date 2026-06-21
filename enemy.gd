extends CharacterBody2D
@onready var locate = get_node("/root/Node2D/Node2D/player")
var player_hp = Global.hp
var player = null
var player_chase= false
var velocidade = 50
var timer = false
func _physics_process(delta: float) -> void:
	
	if player_chase == true :
		
		global_position = global_position.move_toward(locate.global_position, velocidade * delta)
		
	if timer ==  true:
		velocidade = 150
		look_at(locate.global_position)
		%animations.play('activated')
	else:
		velocidade = 50
		%animations.play("idle")
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


func _on_damage_body_entered(body: Node2D) -> void:
	player_hp -= 1
	print("alguma porra")

#death handler
func _on_takes_damage_area_entered(area: Area2D) -> void:
	$CPUParticles2D.emitting = true
	%animations.hide()
	$death.start()
func _on_death_timeout() -> void:
	queue_free()
