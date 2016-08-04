
extends Label


var idioma  = 0
var idioma_dialogo
var idioma_splash
var lenguaje_GUI


func _ready():
#	set_text = get_text()
	lenguaje_GUI = get_text()
	
#	print(lenguaje_GUI)

#	idioma_dialogo = get_owner().get_node("gui/dialogue_box").idioma
#	idioma_splash = get_owner().get_node("gui/splash/label").idioma
#	get_owner().get_node("gui/idioma_gui_save").set_text(lenguaje_GUI)

	set_process(true)

func _process(delta):

	var lenguaje_GUI = get_text()
	if lenguaje_GUI == "castellano":
		var idiomas = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in idiomas:
			idioma.set_idioma1()
#		print("es")


	var lenguaje_GUI =  get_text()
	if lenguaje_GUI == "ingles":
		var idiomas = get_tree().get_nodes_in_group("dialogue_box")
		for idiom in idiomas:
			idiom.set_idioma2()
#		print("in")


	var lenguaje_GUI =  get_text()
	if lenguaje_GUI == "yanomami":
		var idiomas = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in idiomas:
			idioma.set_idioma3()



