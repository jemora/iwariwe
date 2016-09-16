# BONOS COLMENA
extends Node2D

export var value = 1

var sonidolisto
var idioma
var bonos_collected
var linea


func _ready():
	# Initialization here
	if get_owner() != null:
		get_owner().bonos_total += value
		get_owner().get_node("gui/Popup_item/bonos_total").set_text(str(get_owner().bonos_total))
		
	
	get_node("Area2D").connect("body_enter",self,"_collect_gear")
	#get_node("Area2D").connect("body_enter",get_owner().get_node("gui/splash/label"),"_collect_gear")
	
#-----Lista de sonidos
	sonidolisto = get_owner().get_node("gui/fx_btn_item")
#	print(bonos_collected)
	

#	linea = get_owner().bonos_total

func _collect_gear( body ):	
	if get_node("AnimationPlayer").get_current_animation() != "collect":
		if get_owner() != null:
			get_owner().bonos_collected += value
			get_owner().get_node("gui/Popup_item/bonos_collected").set_text(str(get_owner().bonos_collected))

		sonidolisto.play("listo")
		get_node("AnimationPlayer").play("collect")

#----------
		var add_premios = get_tree().get_nodes_in_group("add_premio")
		for premio in add_premios:
			premio.activar()
		var add_premio = get_owner().get_node("gui/add_premios")
		add_premio.frame = 6

#-------------



		if get_owner().bonos_collected == get_owner().bonos_total:
			get_owner().get_node("gui/splash/label").set_text("Nueva colmena ganada")
			sonidolisto.play("premio2")

			var add_bonos = get_tree().get_nodes_in_group("save_load")
			for bonos in add_bonos:
				bonos.add_bonos()

		if get_owner().bonos_collected != get_owner().bonos_total:
			get_owner().get_node("gui/splash/label").set_text("colmena de abejas")

#----------opacidad de los mensajes
			var set_opacidad = get_tree().get_nodes_in_group("mensajes_GUI")
			for dialo in set_opacidad:
				dialo.set_opacidad()



