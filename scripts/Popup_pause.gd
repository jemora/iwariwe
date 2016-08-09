
extends PopupPanel

# member variables here, example:
# var a=2
# var b="textvar"
var controls = true
var slider
var slider_valor = 80

func _ready():
	slider = get_node("opacidad_controles")
	slider_valor = get_node("opacidad_controles/HSlider")
	slider_valor.set_val(50)



func _on_continuar_pressed():
	slider.hide()
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
	slider.show()






func deshabilitar_controles():
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