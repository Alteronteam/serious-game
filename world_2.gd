extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if Global.slowmo:
		#%slowmo_color_effect.show()
		pass
	else:
		#%slowmo_color_effect.hide()
		pass
		#deu nausea só de usar color shift por 2 minutos scr
