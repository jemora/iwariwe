
extends Node

export var line = "default"
var talking = false
var animacion_chaman
export var nombre = ""

var input_states = preload("res://scripts/input_states.gd")
var btn_action = input_states.new("accion")


func _ready():
	add_to_group("dialogos")
	animacion_chaman = get_node("Animation_chaman")
	delta(true)



func delta(delta):
	pass




func ver_dialogo():
	var boxes = get_tree().get_nodes_in_group("dialogue_box")	
	for box in boxes:
		box.show_dialog(line)
	_off_activate()



func _on_activate(): #----viene de actor
	var boxes = get_tree().get_nodes_in_group("dialogue_box")	
	for box in boxes:
		box.show_dialog(line)



	if line == ("chaman1"):
		animacion_chaman.play("hablar")

	if line == ("gracias_fuego"):
		animacion_chaman.play("comer")

	if line == ("huevo"):
		animacion_chaman.play("comer")

	if line == ("huevo_listo"):
		animacion_chaman.play("hablar")

	if line == ("chaman cueva"):
		animacion_chaman.play("hablar")

	if line == ("chaman6"):
		animacion_chaman.play("comer")





#----------activa el tipo de mision solicitada
	if nombre == ("chaman1"):
		var misiones = get_tree().get_nodes_in_group("world")
		for mision in misiones:
			mision.mision_1()

	if nombre == ("chaman2"):
		var misiones = get_tree().get_nodes_in_group("world")
		for mision in misiones:
			mision.mision_2()


	if nombre == ("chaman3"):
		var misiones = get_tree().get_nodes_in_group("world")
		for mision in misiones:
			mision.mision_3()

	if nombre == ("chaman4"):
		var misiones = get_tree().get_nodes_in_group("world")
		for mision in misiones:
			mision.mision_4()

	if nombre == ("chaman5"):
		var misiones = get_tree().get_nodes_in_group("world")
		for mision in misiones:
			mision.mision_5()

	if nombre == ("chaman6"):
		var misiones = get_tree().get_nodes_in_group("world")
		for mision in misiones:
			mision.mision_6()


	if nombre == ("huevo"):
		var misiones = get_tree().get_nodes_in_group("world")
		for mision in misiones:
			mision.mision_7()



#------------------------ gracias_fuego
func _off_activate(): #----viene de actor
	if line == ("chaman1"):
		animacion_chaman.play("reposo_baston")
	if line == ("huevo"):
		animacion_chaman.play("reposo")

	if line == ("chaman3"):
		animacion_chaman.play("reposo_baston")
	if line == ("chaman4"):
		animacion_chaman.play("reposo")

	if line == ("chaman5"):
		animacion_chaman.play("reposo_baston")
	if line == ("chaman6"):
		animacion_chaman.play("reposo")






	var boxes = get_tree().get_nodes_in_group("dialogue_box")	
	for box in boxes:
		box.end_dialog()
	
	var misiones = get_tree().get_nodes_in_group("world")
	for mision in misiones:
		mision.mision_0()

