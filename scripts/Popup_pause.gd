
extends PopupPanel

const path = "user://data.txt"

var controls = true
var caja_slider
var slider = null
var slider_valor = null
var valor_texto

var get_opacidad = 0
var obt_opacidad = false


func _ready():

	caja_slider = get_node("opacidad_controles")
	slider = get_node("opacidad_controles/HSlider")
		

	slider.set_val(0.3) # 1 es 100 %
	slider.set_min(0.0)
	slider.set_max(1)
	set_process(true)






func _process(delta):
	var text_opacidad = get_node("opacidad_controles/opacidad")
	var label_opacidad = get_node("opacidad_controles/opacidad_controles").get_text()

	valor_texto = int(slider.get_val()*100) # transforma de decimales a entero y aumenta el rango a 100 %
	slider_valor = slider.get_val()*100 # valor del slider aumentado
	text_opacidad.set_text(str(label_opacidad) + " " + (str(valor_texto)+ " %")) # texto que se muestra en el label opacidad

# asigna la opacidad a los nodos de los botones
	var izq_dere = get_owner().get_node("gui/left_inputs")
	var salto = get_owner().get_node("gui/right_inputs/TouchScreenButton")
	izq_dere.set_opacity(float(get_opacidad)/30)
	salto.set_opacity(float(get_opacidad)/30)

# llama el valor de opacidad cargado en save_load
	get_opacidad = get_owner().get_node("save_load").opacidad

#	print("popup ", get_opacidad, " slider ", slider_valor)




func _on_continuar_pressed():
	caja_slider.hide()
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






func _on_opacidad_pressed():
	obt_opacidad = true
	caja_slider.show()
	var fondo = get_node("Sprite").hide()
	var btn_continuar = get_node("continuar").hide()
	var btn_salir = get_node("salir").hide()
	var btn_menu = get_node("ir_menu").hide()
	var btn_opacidad = get_node("opacidad").hide()
	var btn_reiniciar = get_node("reiniciar").hide()
	

	






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




func _on_Aplicar_pressed():
	
	obt_opacidad = false
	
	var save_load = get_tree().get_nodes_in_group("save_load")
	for save in save_load:
		save.save_data()






	caja_slider.hide()
	var fondo = get_node("Sprite").show()
	var btn_continuar = get_node("continuar").show()
	var btn_salir = get_node("salir").show()
	var btn_menu = get_node("ir_menu").show()
	var btn_opacidad = get_node("opacidad").show()
	var btn_reiniciar = get_node("reiniciar").show()



