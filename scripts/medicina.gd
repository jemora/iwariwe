# MEDICINA GEAR
extends Node2D

export var value_medicina = 1
export var frame = 1

var sonidolisto

func _ready():
	# Initialization here
	if get_owner() != null:
		get_owner().medicinas_total += value_medicina
		get_owner().get_node("gui/Popup_item/medicinas_total").set_text(str(get_owner().medicinas_total))
	

	get_node("Area2D").connect("body_enter",self,"_collect_gear")
	
#-----Lista de sonidos
	sonidolisto = get_node("SamplePlayer2D")




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
			sonidolisto.play("listo")
			get_node("AnimationPlayer").play("collect")



		#queue_free()  

		if get_owner().medicinas_collected == get_owner().medicinas_total:
			get_owner().get_node("gui/splash/label").set_text("Lista las medicinas")
			sonidolisto.play("vida")

#..........opacidad de los mensajes
			var set_opacidad = get_tree().get_nodes_in_group("mensajes_GUI")
			for dialo in set_opacidad:
				dialo.set_opacidad()


#..........guardar
			var add_medicinas = get_tree().get_nodes_in_group("save_load")
			for medicinas in add_medicinas:
				medicinas.add_medicinas()


# nombre de las medicinas--------------
	if frame == 1:
		get_owner().get_node("gui/splash/label").set_text("Flor blanca")
		var set_opacidad = get_tree().get_nodes_in_group("mensajes_GUI")
		for dialo in set_opacidad:
			dialo.set_opacidad()
	
	
	if frame == 2:
		get_owner().get_node("gui/splash/label").set_text("Flor rosada")
		var set_opacidad = get_tree().get_nodes_in_group("mensajes_GUI")
		for dialo in set_opacidad:
			dialo.set_opacidad()
	
	if frame == 3:
		get_owner().get_node("gui/splash/label").set_text("Flor roja")
		var set_opacidad = get_tree().get_nodes_in_group("mensajes_GUI")
		for dialo in set_opacidad:
			dialo.set_opacidad()
	
	
	if frame == 4:
		get_owner().get_node("gui/splash/label").set_text("Hongo liso")
		var set_opacidad = get_tree().get_nodes_in_group("mensajes_GUI")
		for dialo in set_opacidad:
			dialo.set_opacidad()

	if frame == 5:
		get_owner().get_node("gui/splash/label").set_text("Hongo pintado")
		var set_opacidad = get_tree().get_nodes_in_group("mensajes_GUI")
		for dialo in set_opacidad:
			dialo.set_opacidad()

	