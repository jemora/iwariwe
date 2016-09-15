# Data autoload
extends Node

#const path = "user://share/data.txt"
const path = "user://idiomas.txt"


var opacidad = 0.0
var nivel = 1
var bonos = 0
var medicinas = 0
var plumas = 0
var idioma = 1

var idiomas
var save = true


onready var _label = Label.new()
export (Font) var FONT_latin
export (Font) var FONT_arabe
export (Font) var FONT_chino
export (Font) var FONT_ruso
export (Font) var FONT_japon

export (Theme) var Tema_ruso
export (Theme) var Tema_arabe
export (Theme) var Tema_chino
export (Theme) var Tema_latin
export (Theme) var Tema_japon



func _ready():
#	save_idioma()
	load_data()
#	print_data()
#	gold = 100
#	score = 500
#	name = "Dude"
#	save_data()
#	get_owner().get_node("gui/Popup_item/Bonos_tolal").set_text(str(bonos))
#	get_owner().get_node("gui/Popup_item/Medicina_total").set_text(str(medicinas))
#	get_owner().get_node("gui/Popup_item/Plumas_total").set_text(str(plumas))
#	get_node("name").set_text(name)
	add_to_group("idioma_save")
	
	set_process(true)

	idiomas = get_text()
	
#	print(idioma)



func fuente():


	if (FONT_latin != null):
		if idioma == 1 or idioma == 2 or idioma == 3 or idioma == 5:	
			var font_idioma = get_tree().get_nodes_in_group("font_idioma")
			for font in font_idioma:
				font.add_font_override("font", FONT_latin)
#				font.add_color_override("font_color", Color(0.2, 0.6, 0.8, 1.0))
				font.set_theme(Tema_latin)

				

		if idioma == 6:
			var font_idioma = get_tree().get_nodes_in_group("font_idioma")
			for font in font_idioma:
				font.add_font_override("font", FONT_arabe)
#				font.add_color_override("font_color", Color(0.2, 0.6, 0.8, 1.0))
				font.set_theme(Tema_arabe)


		if idioma == 4:
			var font_idioma = get_tree().get_nodes_in_group("font_idioma")
			for font in font_idioma:
				font.add_font_override("font", FONT_chino)
#				font.add_color_override("font_color", Color(0.9, 0.5, 0.8, 1.0))
				font.set_theme(Tema_chino)
				pass


		if idioma == 7:
			var font_idioma = get_tree().get_nodes_in_group("font_idioma")
			for font in font_idioma:
				font.add_font_override("font", FONT_ruso)
#				font.add_color_override("font_color", Color(0.2, 0.6, 0.8, 1.0))
				font.set_theme(Tema_ruso)



		if idioma == 8:
			var font_idioma = get_tree().get_nodes_in_group("font_idioma")
			for font in font_idioma:
				font.add_font_override("font", FONT_japon)
#				font.add_color_override("font_color", Color(0.2, 0.6, 0.8, 1.0))
				font.set_theme(Tema_japon)

#--------------------------
	
func _process(delta):
	fuente()
	
	if save == true:
		var timer = get_node("Timer")
		timer.start()
		timer.connect('timeout',self,'save')
		
		save = false


	idiomas = get_text()
	if idiomas == "castellano":
		idioma = 1
	
	if idiomas == "ingles":
		idioma = 2

	if idiomas == "yanomami":
		idioma = 3

	if idiomas == "chino":
		idioma = 4

	if idiomas == "portugues":
		idioma = 5

	if idiomas == "arabe":
		idioma = 6

	if idiomas == "ruso":
		idioma = 7

	if idiomas == "japones":
		idioma = 8



#------------------
	if idioma == 1:
		var dialogo = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in dialogo:
			idioma.set_idioma1()

	if idioma == 2:
		var dialogo = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in dialogo:
			idioma.set_idioma2()

	if idioma == 3:
		var dialogo = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in dialogo:
			idioma.set_idioma3()







#-----------------------
func save():
	var timer = get_node("Timer")

	save_idioma()
	timer.stop()





#-------------------------
func load_data():
	print(nivel)
	
	var f = File.new()
	var err = f.open(path,File.READ)
	if err != OK: # err != 0
		print("(load)Couldn't open the file. Error code: ",err)
		return 1 # end loading function
	
	bonos = f.get_var()
	medicinas = f.get_var()
	plumas = f.get_var()
	idioma = f.get_var()
	nivel = f.get_var()
	opacidad = f.get_var()
	print("Data loaded.")
	return 0 # succesfully loaded
	


#---------------------------
func save_idioma():
	print(idioma)

	var f = File.new()
	var err = f.open(path,File.WRITE)
	
	if err != OK: # err != 0
		print("(save)Couldn't open the file. Error code: ",err)
		return 1 # end saving function
	
	f.store_var(bonos)
	f.store_var(medicinas)
	f.store_var(plumas)
	f.store_var(idioma)
	f.store_var(nivel)
	f.store_var(opacidad)

	
	

	
	return 0
	



