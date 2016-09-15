# BONOS PLUMAS
extends Node2D

export var nivel = 2

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
	sonidolisto.play("explosion_magia")
	
	# asigna el nuevo nivel que esta el la var de checkpoint_nex
	var niveles = get_node("idioma_gui_save")
	niveles.nivel = nivel



# no es necesario la variable de nivel, ya se guarda el nivel en idioma_gui_save, lo que desbloquea el nivel en el menu
#	if nivel == 2: 
	timer = get_node("Timer")
	timer.start()
	timer.connect('timeout',self,'level_')

	var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
	for reinicio in mensajes_GUI:
		reinicio.set_text("Gracias, hasta pronto")
		
	var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
	for reinicio in mensajes_GUI:
		reinicio.set_opacidad()

	var mensajes_GUI = get_tree().get_nodes_in_group("nivel_save")
	for save in mensajes_GUI:
		save.save()



func level_():
	if nivel == 1:
		get_tree().change_scene("res://elementos/menu.scn")
	if nivel == 2:
		get_tree().change_scene("res://elementos/menu.scn")
	if nivel == 3:
		get_tree().change_scene("res://elementos/menu.scn")
	if nivel == 4:
		get_tree().change_scene("res://elementos/menu.scn")








