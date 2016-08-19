
extends Label
# ("res://igu/theme_arabe.thm")

var font_idioma = 2

onready var _label = Label.new()
export (Font) var FONT
export (Font) var FONT_arabe




func _ready():

	add_to_group("temas")
	
#	t.set_color("font_color","Label",Color(0.5,0.2,1.0))
#	l.add_color_override("font_color",Color(0.5,0.1,1.0))
#	t.add_font_override("font",load("res://arabe.fnt"))
#	get_font("arabe.",load("res://arabe.fnt"))
	
#	f.create_from_fnt("res://arabe.fnt")
#	t.add_font_override("",f)
#	t.set_color("l",0.5,0.2,1.0)
	
#	l.set_theme(t)
	
	add_color_override("font_color", Color(0.2, 0.6, 0.8, 1.0))
#	add_font_override("font", load("res://arabe.fnt"))
#	add_child(_label)

#	add_child(_label)







	fuente()


func fuente():


	if (FONT != null):
		if font_idioma == 1:	
			var font_idioma = get_tree().get_nodes_in_group("font_idioma")
			for font in font_idioma:
				font.add_font_override("font", FONT_arabe)

		if font_idioma ==2:
			var font_idioma = get_tree().get_nodes_in_group("font_idioma")
			for font in font_idioma:
				font.add_font_override("font", FONT_arabe)
