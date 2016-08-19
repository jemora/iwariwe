
extends RichTextLabel

export (Font) var FONT_latin
export (Font) var FONT_arabe
export (Font) var FONT_chino
export (Font) var FONT_ruso

var f


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	add_to_group("font_idioma")

	set_process(true)
	
	
func _process(delta):
#	push_font(FONT_latin)
#	push_color(Color(0.2, 0.6, 0.8, 1.0))

#	f =File.new()
#	f.open('res://scripts/gdscript.csv',1)
#	add_text(f.get_csv_line()[1])
#	set_bbcode(f.get_csv_line()[1])
	
	



	pass


