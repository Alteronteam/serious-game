extends Control

func _ready() -> void:
	$AnimatedSprite2D.play("default")




func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
	Global.hp = 4.0
	Global.levels = 0


func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://world.tscn")
	Global.hp = 4.0
	Global.levels = 0
