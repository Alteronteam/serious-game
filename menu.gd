extends Control



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_button_pressed() -> void:
	$ColorRect/Control/AnimatedSprite2D.play("active")
	%button_sprite.play("gray")
	$Timer.start()
	
	
	

	
func _on_animated_sprite_2d_animation_finished() -> void:
	get_tree().change_scene_to_file("res://world.tscn")
	Global.levels = 0


func _on_timer_timeout() -> void:
	%button_sprite.hide()
