
extends Node2D

export var valor = 1
export var color = 1

var sonidolisto


func _ready():
	add_to_group("tela_arana")
	if get_owner() != null:
		get_owner().pluma_total += valor
		get_owner().get_node("gui/Popup_item/plumas_total").set_text(str(get_owner().pluma_total))

	
	
	get_node("Area2D").connect("body_enter",self,"coge_pluma")
	#get_node("Area2D").connect("body_enter",get_owner().get_node("gui/splash/label"),"_collect_gear")
	
#-----Lista de sonidos
	sonidolisto = get_owner().get_node("gui/fx_btn_item")


func coge_pluma( body ):


#	sonidolisto.play("listo")
#	get_node("AnimationPlayer").play("collect")

	if get_node("AnimationPlayer").get_current_animation() != "collect":
		if get_owner() != null:
			get_owner().pluma_collected += valor
			get_owner().get_node("gui/Popup_item/plumas_collected").set_text(str(get_owner().pluma_collected))
			if valor == 1:# roja
				sonidolisto.play("listo")
			elif valor != 1 or color == 7:# 
				sonidolisto.play("premio2")


				
			get_node("AnimationPlayer").play("collect")



		if get_owner().pluma_collected == get_owner().pluma_total:
			get_owner().get_node("gui/splash/label").set_text("Pluma premio")
			sonidolisto.play("premio2")
			



#..........guardar
			var add_plumas = get_tree().get_nodes_in_group("save_load")
			for pluma in add_plumas:
				pluma.add_plumas()






	if color == 1: # azul
		sonidolisto.play("premio2")

		var mensajes_pluma = get_tree().get_nodes_in_group("world")
		for pluma in mensajes_pluma:
			pluma.pluma_premio()

		var add_premios = get_tree().get_nodes_in_group("add_premio")
		for premio in add_premios:
			premio.activar()
		var add_premio = get_owner().get_node("gui/add_premios")
		add_premio.frame = 8


	if color == 2:# amarilla
		sonidolisto.play("premio2")

		var mensajes_pluma = get_tree().get_nodes_in_group("world")
		for pluma in mensajes_pluma:
			pluma.pluma_premio2()

		var add_premios = get_tree().get_nodes_in_group("add_premio")
		for premio in add_premios:
			premio.activar()
		var add_premio = get_owner().get_node("gui/add_premios")
		add_premio.frame = 7


	if color == 3:# morada
		sonidolisto.play("premio2")

		var mensajes_pluma = get_tree().get_nodes_in_group("world")
		for pluma in mensajes_pluma:
			pluma.pluma_premio3()

		var add_premios = get_tree().get_nodes_in_group("add_premio")
		for premio in add_premios:
			premio.activar()
		var add_premio = get_owner().get_node("gui/add_premios")
		add_premio.frame = 9



	if color == 4:# roja
		sonidolisto.play("premio2")

		var mensajes_pluma = get_tree().get_nodes_in_group("world")
		for pluma in mensajes_pluma:
			pluma.pluma_premio4()

		var add_premios = get_tree().get_nodes_in_group("add_premio")
		for premio in add_premios:
			premio.activar()
		var add_premio = get_owner().get_node("gui/add_premios")
		add_premio.frame = 10





	if color == 5:# verde
		sonidolisto.play("premio2")

		var mensajes_pluma = get_tree().get_nodes_in_group("world")
		for pluma in mensajes_pluma:
			pluma.pluma_premio5()

		var add_premios = get_tree().get_nodes_in_group("add_premio")
		for premio in add_premios:
			premio.activar()
		var add_premio = get_owner().get_node("gui/add_premios")
		add_premio.frame = 11




	if color == 6:# pluma blanca recoleccion, completar para ganar una dorada

		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad()

		var grito = get_owner().get_node("gui/splash/label")
		grito.set_text("Pluma blanca")	




	if color == 7:# huevo
		sonidolisto.play("premio2")

		var mensajes_pluma = get_tree().get_nodes_in_group("world")
		for pluma in mensajes_pluma:
			pluma.huevo_premio()
		queue_free()
		
		var add_premios = get_tree().get_nodes_in_group("add_premio")
		for premio in add_premios:
			premio.activar()
		var add_premio = get_owner().get_node("gui/add_premios")
		add_premio.frame = 12
		



	if valor == 10:# pluma blanca recoleccion, completar para ganar una dorada

		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad()

		var grito = get_owner().get_node("gui/splash/label")
		grito.set_text("Pluma roja")
		
		
	if valor == 5:# pluma blanca recoleccion, completar para ganar una dorada

		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad()

		var grito = get_owner().get_node("gui/splash/label")
		grito.set_text("Pluma verde")