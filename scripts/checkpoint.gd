# BONOS PLUMAS
extends Node2D

export var nivel = 1

var sonidolisto
var timer
var colision

func _ready():
#	add_to_group("plumas")
	
	get_node("Area2D").connect("body_enter",self,"next")
	#get_node("Area2D").connect("body_enter",get_owner().get_node("gui/splash/label"),"_collect_gear")
	
#-----Lista de sonidos
	sonidolisto = get_node("SamplePlayer2D")



func next( body ):

	if nivel == 2: # pluma dorada

		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_text("Gracias, hasta pronto")
			
		timer = get_node("Timer")
		timer.start()
		timer.connect('timeout',self,'level_2')
		
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad()



func level_2():
	get_tree().change_scene("res://niveles/level_01_a.xml")






