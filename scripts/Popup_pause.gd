
extends PopupPanel

# member variables here, example:
# var a=2
# var b="textvar"
var controls = true


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass




func _on_continuar_pressed():
	var mensajes_GUI = get_tree().get_nodes_in_group("world")
	for continuar in mensajes_GUI:
		continuar._on_continuar_pressed()


func _on_salir_pressed():
	get_tree().quit()


func _on_ir_menu_pressed():
	get_tree().set_pause(false)
	get_tree().change_scene("res://menu/idioma/idiomas.scn")


func _on_reiniciar_pressed():
	get_tree().set_pause(false)
	get_tree().reload_current_scene()






func _on_controles_pressed():
	if controls == true:
		var controles = get_owner().get_node("gui/left_inputs")
		var controles2 = get_owner().get_node("gui/right_inputs/TouchScreenButton")
		controles.hide()
		controles2.hide()
		controls == false

	if controls == false:
		var controles = get_owner().get_node("gui/left_inputs")
		var controles2 = get_owner().get_node("gui/right_inputs/TouchScreenButton")
		controles.show()
		controles2.show()
		controls == true