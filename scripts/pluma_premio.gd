# BONOS PLUMAS
extends Node2D

export var color = 1

var sonidolisto



func _ready():
#	add_to_group("plumas")
	
	get_node("Area2D").connect("body_enter",self,"coge_pluma")
	#get_node("Area2D").connect("body_enter",get_owner().get_node("gui/splash/label"),"_collect_gear")
	
#-----Lista de sonidos
	sonidolisto = get_node("SamplePlayer2D")



func coge_pluma( body ):

	sonidolisto.play("premio2")
	get_node("AnimationPlayer").play("collect")


	if color == 6: # pluma dorada
		var mensajes_GUI = get_tree().get_nodes_in_group("save_load")
		for pluma in mensajes_GUI:
			pluma.add_plumas()
			pluma.save_data()


		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.pluma_coleccion()





# estos valores hacen que coloque las plumas en los item, cada valor equivale a un color de pluma, cero no hace nada
	if color == 1: # azul

		var mensajes_pluma = get_tree().get_nodes_in_group("world")
		for pluma in mensajes_pluma:
			pluma.pluma_premio()


	if color == 2:# amarilla

		var mensajes_pluma = get_tree().get_nodes_in_group("world")
		for pluma in mensajes_pluma:
			pluma.pluma_premio2()


	if color == 3:# morada

		var mensajes_pluma = get_tree().get_nodes_in_group("world")
		for pluma in mensajes_pluma:
			pluma.pluma_premio3()


	if color == 4:# roja

		var mensajes_pluma = get_tree().get_nodes_in_group("world")
		for pluma in mensajes_pluma:
			pluma.pluma_premio4()


	if color == 5:# verde

		var mensajes_pluma = get_tree().get_nodes_in_group("world")
		for pluma in mensajes_pluma:
			pluma.pluma_premio5()






