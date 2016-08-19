
extends PopupPanel

var medicina_total
var medicina_colectada
var sonido
var medicina
var colmena
var plumas


func _ready():
	set_process(true)

	medicina_colectada = get_node("medicinas_collected")
	medicina_total = get_node("medicinas_total")
	sonido = get_node("SamplePlayer2D")

	colmena = get_node("Bonos_tolal")
	medicina = get_node("Medicina_total")
	plumas = get_node("plumas_total")



func _on_continuar_item_pressed():
	var mensajes_GUI = get_tree().get_nodes_in_group("world")
	for continuar in mensajes_GUI:
		continuar._on_continuar_item_pressed()


func _on_icon_bonos_pressed():
	var mensajes_GUI = get_tree().get_nodes_in_group("save_load")
	for usar in mensajes_GUI:
		usar.restar_bonos()
#	if colmena != "0":
		sonido.play("listo")

func _on_icon_medicinas_pressed():
	var mensajes_GUI = get_tree().get_nodes_in_group("save_load")
	for usar in mensajes_GUI:
		usar.restar_medicinas()
#	if medicina != "0":
		sonido.play("listo")

func _on_icon_plumas_pressed():
	var mensajes_GUI = get_tree().get_nodes_in_group("save_load")
	for usar in mensajes_GUI:
		usar.restar_plumas()
#	if plumas != "0":
		sonido.play("listo")


func _process(delta):
	
	pass



