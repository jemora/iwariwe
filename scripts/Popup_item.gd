
extends PopupPanel

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():

	pass

func _on_continuar_item_pressed():
	var mensajes_GUI = get_tree().get_nodes_in_group("world")
	for continuar in mensajes_GUI:
		continuar._on_continuar_item_pressed()


func _on_icon_bonos_pressed():
	var mensajes_GUI = get_tree().get_nodes_in_group("save_load")
	for usar in mensajes_GUI:
		usar.restar_bonos()

func _on_icon_medicinas_pressed():
	var mensajes_GUI = get_tree().get_nodes_in_group("save_load")
	for usar in mensajes_GUI:
		usar.restar_medicinas()


func _on_icon_plumas_pressed():
	var mensajes_GUI = get_tree().get_nodes_in_group("save_load")
	for usar in mensajes_GUI:
		usar.restar_plumas()
