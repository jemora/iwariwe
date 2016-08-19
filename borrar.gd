
extends Label

# member variables here, example:
# var a=2
# var b="textvar"
export (Font) var FONT_latin
export (Font) var FONT_arabe
export (Font) var FONT_chino
export (Font) var FONT_ruso

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	add_to_group("font_idioma")

	set_process(true)
	
	
func _process(delta):
	add_font_override("font", FONT_latin)
	add_color_override("font_color", Color(0.2, 0.6, 0.8, 1.0))
	



	pass
