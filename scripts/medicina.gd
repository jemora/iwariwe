# MEDICINA GEAR
extends Node2D

export var value_medicina = 1
export var frame = 1

var sonidolisto
var fx

export var sound = "explosion_magia"

func _ready():
	set_process(true)
	# Initialization here
	if get_owner() != null:
		get_owner().medicinas_total += value_medicina
		get_owner().get_node("gui/Popup_item/medicinas_total").set_text(str(get_owner().medicinas_total))
	

	get_node("Area2D").connect("body_enter",self,"_collect_gear")
	
#-----Lista de sonidos
	sonidolisto = get_node("SamplePlayer2D")
	fx = get_owner().get_node("SamplePlayer2D")



	
	

	if frame == 1: 
		get_node("frame").set_frame(1)
		get_node("Sprite1").show()
		get_node("Sprite2").hide()
		get_node("AnimationPlayer").play("fx")
	
	
	
	if frame == 2: 
		get_node("frame").set_frame(2)
		get_node("Sprite1").show()
		get_node("Sprite2").hide()
		get_node("AnimationPlayer").play("fx")
	
	
	if frame == 3: 
		get_node("frame").set_frame(3)
		get_node("Sprite1").show()
		get_node("Sprite2").hide()
		get_node("AnimationPlayer").play("fx")
	
	
	if frame == 4: 
		get_node("frame").set_frame(4)
		get_node("Sprite1").hide()
		get_node("Sprite2").show()	
		get_node("AnimationPlayer").play("fx2")
	
	if frame == 5: 
		get_node("frame").set_frame(5)
		get_node("Sprite1").hide()
		get_node("Sprite2").show()
		get_node("AnimationPlayer").play("fx2")






func _collect_gear( body ):
	if get_node("AnimationPlayer").get_current_animation() != "collect":
		if get_owner() != null:
			get_owner().medicinas_collected += value_medicina
			get_owner().get_node("gui/Popup_item/medicinas_collected").set_text(str(get_owner().medicinas_collected))
			sonidolisto.play("premio")
			get_node("AnimationPlayer").play("collect")


#..........guardar
	if get_owner().medicinas_collected == get_owner().medicinas_total:
		var add_medicinas = get_tree().get_nodes_in_group("save_load")
		for medicinas in add_medicinas:
			medicinas.add_medicinas()
			
		fx.play("explosion_magia")









# nombre de las medicinas--------------
	if frame == 1:
		get_owner().get_node("gui/splash/label").set_text("Flor blanca")
		var set_opacidad = get_tree().get_nodes_in_group("mensajes_GUI")
		for dialo in set_opacidad:
			dialo.set_opacidad()
			
		var add_premios = get_tree().get_nodes_in_group("add_premio")
		for premio in add_premios:
			premio.activar()
		var add_premio = get_owner().get_node("gui/add_premios")
		add_premio.frame = 1
	
	
	if frame == 2:
		get_owner().get_node("gui/splash/label").set_text("Flor rosada")
		var set_opacidad = get_tree().get_nodes_in_group("mensajes_GUI")
		for dialo in set_opacidad:
			dialo.set_opacidad()

		var add_premios = get_tree().get_nodes_in_group("add_premio")
		for premio in add_premios:
			premio.activar()
		var add_premio = get_owner().get_node("gui/add_premios")
		add_premio.frame = 2


	if frame == 3:
		get_owner().get_node("gui/splash/label").set_text("Flor roja")
		var set_opacidad = get_tree().get_nodes_in_group("mensajes_GUI")
		for dialo in set_opacidad:
			dialo.set_opacidad()
	
		var add_premios = get_tree().get_nodes_in_group("add_premio")
		for premio in add_premios:
			premio.activar()
		var add_premio = get_owner().get_node("gui/add_premios")
		add_premio.frame = 3


	if frame == 4:
		get_owner().get_node("gui/splash/label").set_text("Hongo liso")
		var set_opacidad = get_tree().get_nodes_in_group("mensajes_GUI")
		for dialo in set_opacidad:
			dialo.set_opacidad()
			
		var add_premios = get_tree().get_nodes_in_group("add_premio")
		for premio in add_premios:
			premio.activar()
		var add_premio = get_owner().get_node("gui/add_premios")
		add_premio.frame = 4
		

	if frame == 5:
		get_owner().get_node("gui/splash/label").set_text("Hongo pintado")
		var set_opacidad = get_tree().get_nodes_in_group("mensajes_GUI")
		for dialo in set_opacidad:
			dialo.set_opacidad()

		var add_premios = get_tree().get_nodes_in_group("add_premio")
		for premio in add_premios:
			premio.activar()
		var add_premio = get_owner().get_node("gui/add_premios")
		add_premio.frame = 5



func _process(delta):
	
	if get_owner().medicinas_collected == get_owner().medicinas_total:
		get_owner().get_node("gui/splash/label").set_text("Lista las medicinas")



#..........opacidad de los mensajes
	var set_opacidad = get_tree().get_nodes_in_group("mensajes_GUI")
	for dialo in set_opacidad:
		dialo.set_opacidad()




		


