
extends Label


var fnt_idioma  = 0
var idioma_dialogo
var idioma_splash
var lenguaje_GUI


#onready var _label = Label.new()
export (Font) var FONT_latin
export (Font) var FONT_arabe
export (Font) var FONT_chino
export (Font) var FONT_ruso
export (Theme) var Tema_ruso
export (Theme) var Tema_arabe
export (Theme) var Tema_chino
export (Theme) var Tema_latin


func _ready():
#	set_text = get_text()
	lenguaje_GUI = get_text()
	
#	print(lenguaje_GUI)

#	idioma_dialogo = get_owner().get_node("gui/dialogue_box").idioma
#	idioma_splash = get_owner().get_node("gui/splash/label").idioma
#	get_owner().get_node("gui/idioma_gui_save").set_text(lenguaje_GUI)

	set_process(true)


func fuente():


	if (FONT_latin != null):
		if fnt_idioma == 1 or fnt_idioma == 2 or fnt_idioma == 3 or fnt_idioma == 5:	
			var font_idioma = get_tree().get_nodes_in_group("font_idioma")
			for font in font_idioma:
				font.add_font_override("font", FONT_latin)
#				font.add_color_override("font_color", Color(0.2, 0.6, 0.9, 1.0))
				font.set_theme(Tema_latin)


		if fnt_idioma == 6:
			var font_idioma = get_tree().get_nodes_in_group("font_idioma")
			for font in font_idioma:
				font.add_font_override("font", FONT_arabe)
#				font.add_color_override("font_color", Color(0.2, 0.6, 0.9, 1.0))
				font.set_theme(Tema_arabe)
				

		if fnt_idioma == 4:
			var font_idioma = get_tree().get_nodes_in_group("font_idioma")
			for font in font_idioma:
				font.add_font_override("font", FONT_chino)
#				font.add_color_override("font_color", Color(0.2, 0.6, 0.9, 1.0))
				font.set_theme(Tema_chino)



		if fnt_idioma == 7:
			var font_idioma = get_tree().get_nodes_in_group("font_idioma")
			for font in font_idioma:
				font.add_font_override("font", FONT_ruso)
#				font.add_color_override("font_color", Color(0.2, 0.6, 0.9, 1.0))
				font.set_theme(Tema_ruso)
				








func _process(delta):
	fuente()

	var lenguaje_GUI = get_text()
	if lenguaje_GUI == "castellano":
		var idiomas = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in idiomas:
			idioma.set_idioma1()
		fnt_idioma = 1
#		print("es")


	var lenguaje_GUI =  get_text()
	if lenguaje_GUI == "ingles":
		var idiomas = get_tree().get_nodes_in_group("dialogue_box")
		for idiom in idiomas:
			idiom.set_idioma2()
		fnt_idioma = 2
#		print("in")


	var lenguaje_GUI =  get_text()
	if lenguaje_GUI == "yanomami":
		var idiomas = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in idiomas:
			idioma.set_idioma3()
		fnt_idioma = 3

	var lenguaje_GUI =  get_text()
	if lenguaje_GUI == "chino":
		var idiomas = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in idiomas:
			idioma.set_idioma4()
		fnt_idioma = 4

	var lenguaje_GUI =  get_text()
	if lenguaje_GUI == "portugues":
		var idiomas = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in idiomas:
			idioma.set_idioma5()
		fnt_idioma = 5

	var lenguaje_GUI =  get_text()
	if lenguaje_GUI == "arabe":
		var idiomas = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in idiomas:
			idioma.set_idioma6()
		fnt_idioma = 6


	var lenguaje_GUI =  get_text()
	if lenguaje_GUI == "ruso":
		var idiomas = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in idiomas:
			idioma.set_idioma7()
		fnt_idioma = 7



