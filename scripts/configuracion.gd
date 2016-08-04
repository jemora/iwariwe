
extends Control

# member variables here, example:
# var a=2
# var b="textvar"

var idioma = 1

func _ready():
	
	pass



func _on_Button_item_selected(Ingles):
	
#	idioma = 1
#	print (idioma)

	idioma = 2
#	get_tree().set_pause(true)
	#	print (idioma)




	if idioma == 1:
		var idiomas = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in idiomas:
			idioma.set_idioma1()

		var gui = get_tree().get_nodes_in_group("Idioma_GUI")
		for idioma in gui:
			idioma.set_idioma1()



	if idioma == 2:
		var idiomas = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in idiomas:
			idioma.set_idioma2()

		var gui = get_tree().get_nodes_in_group("Idioma_GUI")
		for idioma in gui:
			idioma.set_idioma2()


	if idioma == 3:
		var idiomas = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in idiomas:
			idioma.set_idioma3()

		var gui = get_tree().get_nodes_in_group("Idioma_GUI")
		for idioma in gui:
			idioma.set_idioma3()


