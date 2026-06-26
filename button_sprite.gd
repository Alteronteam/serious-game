extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if global_position.y < 181:
		global_position.y = lerp(151,181,1*delta)
	else:
		global_position.y = lerp(181,151,1*delta)
	
	
