
extends Node2D

var bonos_total = 0
var bonos_collected = 0
var medicinas_total = 0
var medicinas_collected = 0

var pluma_total = 0
var pluma_collected = 0


#var player_animation
var player
var porecito
var ray
var telarana
var tela_activa = true
var ave
#var speed = 200
var restart_line
#var player_samples
#var porecito_samples
#var hearts
var kissable = true
var reiniciar = true
var timer
var timer_poresito
var next_level = ""
var checkpoint
var fx
var sonidos_player

var import_chispa = preload("res://../elementos/fuego.scn")
var import_pluma = preload("res://../elementos/pluma.xml")
var checkpoint2 = preload("res://../elementos/checkpoint_nex.scn")


var input_states = preload("res://scripts/input_states.gd")
var btn_action = input_states.new("accion")
var btn_jump = input_states.new("btn_jump")
var pausa = input_states.new("pausa")
var items = input_states.new("items")


var tela_arana
var ave_fuego
var ave_ray
var ave_ray2
var ave_ray_arriba
var ave_viva = true
var mision_lista = false
var mision_n = 0
var mision_item_1 = ""
var mision_item_2 = ""
var mision_item_3 = ""

var mision_frame_fuego = 0
var mision_frame_pluma_azul = 0
var mision_frame_pluma_amarilla = 0
var mision_frame_pluma_morada = 0
var mision_frame_pluma_roja = 0
var mision_frame_pluma_verde = 0
var mision_frame_huevo = 0

var huevo
var plumero
var caiman
var caiman_sensor_frente
var caiman_sensor_arriba

var timer_20
var timer_9

var sonido_cueva1
var sonido_viento
var sonido_cueva_caiman
var agua = false




func _ready():
#	get_node("Ave_fuego").connect("body_enter", get_node("telaraña"), "restar")
#	get_node("mundo/reinicio").connect("body_enter", get_node("player"), "_reiniciar_juego")
	add_to_group("world")






#------------------------------------------
	set_process(true)

	player = get_node("player")
	player.set_contact_monitor(true)
	player.set_max_contacts_reported(true)
	player.set_mode(2)
	
	telarana = get_node("telarana")
	
	ave = get_node("Ave_fuego")
	ave.set_contact_monitor(true)
	ave.set_max_contacts_reported(true)
	ave.set_mode(2)
	
	
	
	porecito = get_node("elementos/poresito")
	porecito.set_mode(2)
	ray = get_node("player/RayCast2D")
	ray.add_exception(player)
	fx = get_node("fx")
	sonidos_player = get_node("player/SamplePlayer2D")



#	player_samples = get_node("SamplePlayer")
#	porecito_samples = get_node("SamplePlayer 2")
	restart_line = get_node("mundo/reinicio")
	checkpoint = get_node("checkpoint")
	timer = get_node("Timer")
	timer_poresito = get_node("Timer_reinicio")
	sonido_cueva1 = get_node("sonido_cueva1/SamplePlayer2D")
	sonido_cueva_caiman = get_node("sonido_cueva_caiman/SamplePlayer2D")
	sonido_viento = get_node("sonido_viento/SamplePlayer2D")
	


	tela_arana = get_tree().get_nodes_in_group("tela_arana")
	ave_ray = get_node("Ave_fuego/RayCast2D")
	ave_ray2 = get_node("Ave_fuego/RayCast2D1")
	ave_ray_arriba = get_node("Ave_fuego/RayCast_arriba")
	ave_fuego = get_node("Ave_fuego")
	caiman = get_node("Caiman_move/caiman")
	caiman_sensor_frente = get_node("Caiman_move/caiman/Area2D/sensor_adelante")
	caiman_sensor_arriba = get_node("Caiman_move/caiman/Area2D/sensor_arriba")



#--reproduce los sonidos al inicio--------------------------
	sonido_cueva1()
	sonido_viento()
	sonido_cueva_caiman()

#--repite los sonidos----------------------
	timer_20 = get_node("Timer_20")
	timer_20.start()
	timer_20.connect('timeout',self,'sonido_cueva1')
	timer_20.connect('timeout',self,'sonido_cueva_caiman')

	timer_9 = get_node("Timer_9")
	timer_9.start()
	timer_9.connect('timeout',self,'sonido_viento')
	





func _process(delta):
	

	
	for tela_arana in get_tree().get_nodes_in_group("tela_arana"):
		if ave_viva == true:
			ave_ray.add_exception(tela_arana)
			ave_ray2.add_exception(tela_arana)
			ave_ray_arriba.add_exception(tela_arana)



	for player in get_tree().get_nodes_in_group("player"):
		if ave_viva == true:
			ave_ray_arriba.add_exception(player)


	
	if porecito in player.get_colliding_bodies():
		if kissable:
			kissable = false
			timer.start()
			timer.connect('timeout',self,'next_level')

	
	if restart_line in player.get_colliding_bodies():
		if reiniciar:
			reiniciar = false
			timer.start()
			timer.connect('timeout',self,'restar')
#			restart_line.queue_free()
			sonidos_player.play("pancada_agua")
			var grito = get_node("gui/splash/label")
			grito.set_text("Agua")


	if checkpoint in player.get_colliding_bodies():
		if reiniciar:
			reiniciar = false
			timer.start()
			timer.set_wait_time(0.1)
			timer.connect('timeout',self,'misio_fuego')
			sonidos_player.play("vida")
			var grito = get_node("gui/splash/label")
			grito.set_text("Mision")
			checkpoint.queue_free()



#-------caiman--------------
	if caiman in player.get_colliding_bodies():
		if reiniciar:
			reiniciar = false
			timer.start()
			timer.connect('timeout',self,'restar')
			sonidos_player.play("grito_muerte_caiman")
			fx.play("pancada_agua")
			var grito = get_node("gui/splash/label")
			grito.set_text("caiman")			
			var dialogo = get_tree().get_nodes_in_group("caiman")
			for dialo in dialogo:
				dialo.atacar_arriba()

	if caiman_sensor_frente in player.get_colliding_bodies():
		if reiniciar:
			reiniciar = false
			timer_poresito.start()
			timer_poresito.connect('timeout',self,'restar')
			sonidos_player.play("grito_muerte_caiman")
			fx.play("pancada_agua")
			var grito = get_node("gui/splash/label")
			grito.set_text("caiman")
			var dialogo = get_tree().get_nodes_in_group("caiman")
			for dialo in dialogo:
				dialo.atacar()

	if caiman_sensor_arriba in player.get_colliding_bodies():
		if reiniciar:
			reiniciar = false
			timer_poresito.start()
			timer_poresito.connect('timeout',self,'restar')
			sonidos_player.play("grito_muerte_caiman")
			fx.play("pancada_agua")
			var grito = get_node("gui/splash/label")
			grito.set_text("caiman")
			var dialogo = get_tree().get_nodes_in_group("caiman")
			for dialo in dialogo:
				dialo.atacar_arriba()




#--------muerte del ave-----------
	if tela_activa == true and telarana in ave.get_colliding_bodies():
		var ave_fuego = get_tree().get_nodes_in_group("ave")
		for ave in ave_fuego:
			if tela_activa:
				tela_activa = false
				ave.restar()


#---------- entrega de pluma
	if plumero in player.get_colliding_bodies():
			var grito = get_node("gui/splash/label")
			grito.set_text("plumero")
			fx.play("vida")










#---------------------------- boton enter
	if  btn_action.check() == 1:
#		var chispa = import_chispa.instance()
#		chispa.set_name("fuego")
#		chispa.set_pos(get_node("Ave_fuego/Position2D").get_global_pos())
#		add_child(chispa)
#		ave.queue_free()
		print("A= " + mision_item_1, "B= " + mision_item_2, "C= " + mision_item_3, "Mision= " + str(mision_n))
#		print (mision_n)

#---------------------------- boton enter misiones

		_on_items_mision_pressed()


		_on_items_mision2_pressed()


		_on_items_mision3_pressed()







		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad()
			


	if  pausa.check() == 1:
		_on_pausa_pressed()


	if  items.check() == 1:
		_on_items_pressed()



#-------SONIDOS AMBIENTE----------

func sonido_cueva1():
	sonido_cueva1.play("ambiente_sapo_grillos")

func sonido_cueva_caiman():
	sonido_cueva_caiman.play("cueva_caiman")

func sonido_viento():
	sonido_viento.play("viento")





#--------------transicion escenas--------------
func misio_fuego():
	get_tree().change_scene("res://niveles/transicion.scn")



func gui_item_fuego():
	
#--------TIPO DE MISION-----
	if mision_frame_fuego == 1:# fuego para el chaman
		if mision_item_1 == "": 
			get_node("gui/items_mision").show()
			get_node("gui/items_mision/fuego").show()
			mision_item_1 = "fuego"

		elif mision_item_2 == "":
			get_node("gui/items_mision2").show()
			get_node("gui/items_mision2/fuego").show()
			mision_item_2 = "fuego"

		elif mision_item_3 == "":
			get_node("gui/items_mision3").show()
			get_node("gui/items_mision3/fuego").show()
			mision_item_3 = "fuego"






# limpiar
	if mision_frame_fuego == 0:
		if mision_item_1 == "fuego":
			get_node("gui/items_mision").hide()
			get_node("gui/items_mision/fuego").hide()
			mision_item_1 = ""
			
		elif mision_item_2 == "fuego":
			get_node("gui/items_mision2").hide()
			get_node("gui/items_mision2/fuego").hide()
			mision_item_2 = ""

		elif mision_item_3 == "fuego":
			get_node("gui/items_mision3").hide()
			get_node("gui/items_mision3/fuego").hide()
			mision_item_3 = ""






#---------------------
func gui_item_pluma_azul(): 
	if mision_frame_pluma_azul == 1:# pluma azul
		if mision_item_1 == "": 
			get_node("gui/items_mision/AnimatedSprite_varios").set_frame(3)
			get_node("gui/items_mision").show()
			mision_item_1 = "pazul"

		elif mision_item_2 == "":
			get_node("gui/items_mision2/AnimatedSprite_varios").set_frame(3)
			get_node("gui/items_mision2").show()
			mision_item_2 = "pazul"

		elif mision_item_3 == "":
			get_node("gui/items_mision3/AnimatedSprite_varios").set_frame(3)
			get_node("gui/items_mision3").show()
			mision_item_3 = "pazul"





# limpiar item
	if mision_frame_pluma_azul == 0:# pluma azul
		if mision_item_1 == "pazul": 
			get_node("gui/items_mision/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision/AnimatedSprite_varios").hide()
			get_node("gui/items_mision").hide()
			mision_item_1 = ""

		elif mision_item_2 == "pazul": 
			get_node("gui/items_mision2/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision2/AnimatedSprite_varios").hide()
			get_node("gui/items_mision2").hide()
			mision_item_2 = ""

		elif mision_item_3 == "pazul": 
			get_node("gui/items_mision3/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision2/AnimatedSprite_varios").hide()
			get_node("gui/items_mision3").hide()
			mision_item_3 = ""



#------------------------
func gui_item_pluma_amarilla(): 
	if mision_frame_pluma_amarilla == 1:# pluma amarilla
		if mision_item_1 == "":
			get_node("gui/items_mision/AnimatedSprite_varios").set_frame(4)
			get_node("gui/items_mision/AnimatedSprite_varios").show()
			get_node("gui/items_mision").show()
			mision_item_1 = "pamarilla"


		elif mision_item_2 == "":
			get_node("gui/items_mision2/AnimatedSprite_varios").set_frame(4)
			get_node("gui/items_mision2/AnimatedSprite_varios").show()
			get_node("gui/items_mision2").show()
			mision_item_2 = "pamarilla"

		elif mision_item_3 == "":
			get_node("gui/items_mision3/AnimatedSprite_varios").set_frame(4)
			get_node("gui/items_mision3/AnimatedSprite_varios").show()
			get_node("gui/items_mision3").show()
			mision_item_3 = "pamarilla"

# limpiar
	if mision_frame_pluma_amarilla == 0:# pluma amarilla
		if mision_item_1 == "pamarilla":
			get_node("gui/items_mision/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision/AnimatedSprite_varios").show()
			get_node("gui/items_mision").hide()
			mision_item_1 = ""


		elif mision_item_2 == "pamarilla":
			get_node("gui/items_mision2/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision2/AnimatedSprite_varios").show()
			get_node("gui/items_mision2").hide()
			mision_item_2 = ""

		elif mision_item_3 == "pamarilla":
			get_node("gui/items_mision3/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision3/AnimatedSprite_varios").show()
			get_node("gui/items_mision3").hide()
			mision_item_3 = ""






#-----------------------
func gui_item_pluma_morada(): 
	if mision_frame_pluma_morada == 1:# pluma morada
		if mision_item_1 == "":
			get_node("gui/items_mision/AnimatedSprite_varios").set_frame(5)
			get_node("gui/items_mision/AnimatedSprite_varios").show()
			get_node("gui/items_mision").show()
			mision_item_1 = "pmorada"


		elif mision_item_2 == "":
			get_node("gui/items_mision2/AnimatedSprite_varios").set_frame(5)
			get_node("gui/items_mision2/AnimatedSprite_varios").show()
			get_node("gui/items_mision2").show()
			mision_item_2 = "pmorada"

		elif mision_item_3 == "":
			get_node("gui/items_mision3/AnimatedSprite_varios").set_frame(5)
			get_node("gui/items_mision3/AnimatedSprite_varios").show()
			get_node("gui/items_mision3").show()
			mision_item_3 = "pmorada"


# limpiar
	if mision_frame_pluma_morada == 0:# pluma morada
		if mision_item_1 == "pmorada":
			get_node("gui/items_mision/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision/AnimatedSprite_varios").show()
			get_node("gui/items_mision").hide()
			mision_item_1 = ""


		elif mision_item_2 == "pmorada":
			get_node("gui/items_mision2/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision2/AnimatedSprite_varios").show()
			get_node("gui/items_mision2").hide()
			mision_item_2 = ""

		elif mision_item_3 == "pmorada":
			get_node("gui/items_mision3/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision3/AnimatedSprite_varios").show()
			get_node("gui/items_mision3").hide()
			mision_item_3 = ""



#-----------------------
func gui_item_pluma_roja(): 
	if mision_frame_pluma_roja == 1:# pluma roja
		if mision_item_1 == "":
			get_node("gui/items_mision/AnimatedSprite_varios").set_frame(6)
			get_node("gui/items_mision/AnimatedSprite_varios").show()
			get_node("gui/items_mision").show()
			mision_item_1 = "proja"


		elif mision_item_2 == "":
			get_node("gui/items_mision2/AnimatedSprite_varios").set_frame(6)
			get_node("gui/items_mision2/AnimatedSprite_varios").show()
			get_node("gui/items_mision2").show()
			mision_item_2 = "proja"


		elif mision_item_3 == "":
			get_node("gui/items_mision3/AnimatedSprite_varios").set_frame(6)
			get_node("gui/items_mision3/AnimatedSprite_varios").show()
			get_node("gui/items_mision3").show()
			mision_item_3 = "proja"



# limpiar
	if mision_frame_pluma_roja == 0:# pluma roja
		if mision_item_1 == "proja":
			get_node("gui/items_mision/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision/AnimatedSprite_varios").show()
			get_node("gui/items_mision").hide()
			mision_item_1 = ""


		elif mision_item_2 == "proja":
			get_node("gui/items_mision2/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision2/AnimatedSprite_varios").show()
			get_node("gui/items_mision2").hide()
			mision_item_2 = ""


		elif mision_item_3 == "proja":
			get_node("gui/items_mision3/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision3/AnimatedSprite_varios").show()
			get_node("gui/items_mision3").hide()
			mision_item_3 = ""






#-----------------------
func gui_item_pluma_verde(): 
	if mision_frame_pluma_verde == 1:# pluma verde
		if mision_item_1 == "":
			get_node("gui/items_mision/AnimatedSprite_varios").set_frame(7)
			get_node("gui/items_mision/AnimatedSprite_varios").show()
			get_node("gui/items_mision").show()
			mision_item_1 = "pverde"

		elif mision_item_2 == "":
			get_node("gui/items_mision2/AnimatedSprite_varios").set_frame(7)
			get_node("gui/items_mision2/AnimatedSprite_varios").show()
			get_node("gui/items_mision2").show()
			mision_item_2 = "pverde"

		elif mision_item_3 == "":
			get_node("gui/items_mision3/AnimatedSprite_varios").set_frame(7)
			get_node("gui/items_mision3/AnimatedSprite_varios").show()
			get_node("gui/items_mision3").show()
			mision_item_3 = "pverde"


# limpiar
	if mision_frame_pluma_verde == 0:# pluma verde
		if mision_item_1 == "pverde":
			get_node("gui/items_mision/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision/AnimatedSprite_varios").show()
			get_node("gui/items_mision").hide()
			mision_item_1 = ""

		elif mision_item_2 == "pverde":
			get_node("gui/items_mision2/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision2/AnimatedSprite_varios").show()
			get_node("gui/items_mision2").hide()
			mision_item_2 = ""

		elif mision_item_3 == "pverde":
			get_node("gui/items_mision3/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision3/AnimatedSprite_varios").show()
			get_node("gui/items_mision3").hide()
			mision_item_3 = ""




#-----------------------
func gui_item_huevo(): 
	if mision_frame_huevo == 1:# huevo
		if mision_item_1 == "":
			get_node("gui/items_mision/AnimatedSprite_varios").set_frame(8)
			get_node("gui/items_mision/AnimatedSprite_varios").show()
			get_node("gui/items_mision").show()
			mision_item_1 = "huevo"

		elif mision_item_2 == "":
			get_node("gui/items_mision2/AnimatedSprite_varios").set_frame(8)
			get_node("gui/items_mision2/AnimatedSprite_varios").show()
			get_node("gui/items_mision2").show()
			mision_item_2 = "huevo"

		elif mision_item_3 == "":
			get_node("gui/items_mision3/AnimatedSprite_varios").set_frame(8)
			get_node("gui/items_mision3/AnimatedSprite_varios").show()
			get_node("gui/items_mision3").show()
			mision_item_3 = "huevo"


# limpiar
	if mision_frame_huevo == 0:# huevo
		if mision_item_1 == "huevo":
			get_node("gui/items_mision/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision/AnimatedSprite_varios").show()
			get_node("gui/items_mision").hide()
			mision_item_1 = ""

		elif mision_item_2 == "huevo":
			get_node("gui/items_mision2/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision2/AnimatedSprite_varios").show()
			get_node("gui/items_mision2").hide()
			mision_item_2 = ""

		elif mision_item_3 == "huevo":
			get_node("gui/items_mision3/AnimatedSprite_varios").set_frame(0)
#			get_node("gui/items_mision3/AnimatedSprite_varios").show()
			get_node("gui/items_mision3").hide()
			mision_item_3 = ""








#---viene de poresito
func time_start():
	timer_poresito.start()
	timer_poresito.connect('timeout',self,'restar')
	



func restar():
	get_tree().reload_current_scene()



func next_level():
#	get_tree().change_scene(next_level)
#	get_tree().reload_current_scene()
	pass










func _on_pausa_pressed():
	get_node("gui/Popup_pause").set_exclusive(true)
	get_node("gui/Popup_pause").popup()
	get_tree().set_pause(true)


func _on_continuar_pressed():
	get_node("gui/Popup_pause").hide()
	get_tree().set_pause(false)








func pluma(): #------viene del ave, morir
	var chispa = import_chispa.instance()
#		chispa.set_name("fuego")
	chispa.set_pos(get_node("Ave_fuego/Position2D").get_global_pos())
	add_child(chispa)
	fx.play("vida")
	ave_viva = false






func _on_player_body_enter( body ):

#---------chispa fuego
	if (body.has_method("destroy")):
		body.destroy()
		time_start()

		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad()
		
		var grito = get_node("gui/splash/label")
		grito.set_text("Fuegoooo...")


#------pisar agua---------
	if (body.has_method("agua")):
		var mensajes_GUI = get_tree().get_nodes_in_group("player")
		for mensaje in mensajes_GUI:
			mensaje.pisar_agua()
			mensaje.pisar_tierra_off()
			mensaje.pisar_grama_off()
			mensaje.pisar_madera_off()
			mensaje.salto_dificil_off()
			mensaje.rebote_off()
			mensaje.sigilo_off()

#------pisar tierra---------
	if (body.has_method("tierra")):
		var mensajes_GUI = get_tree().get_nodes_in_group("player")
		for mensaje in mensajes_GUI:
			mensaje.pisar_agua_off()
			mensaje.pisar_tierra()
			mensaje.pisar_grama_off()
			mensaje.pisar_madera_off()
			mensaje.salto_dificil_off()
			mensaje.rebote_off()
			mensaje.sigilo_off()


#------pisar grama---------
	if (body.has_method("grama")):
		var mensajes_GUI = get_tree().get_nodes_in_group("player")
		for mensaje in mensajes_GUI:
			mensaje.pisar_agua_off()
			mensaje.pisar_tierra_off()
			mensaje.pisar_grama()
			mensaje.pisar_madera_off()
			mensaje.salto_dificil_off()
			mensaje.rebote_off()
			mensaje.sigilo_off()


#------pisar madera---------
	if (body.has_method("madera")):
		var mensajes_GUI = get_tree().get_nodes_in_group("player")
		for mensaje in mensajes_GUI:
			mensaje.pisar_agua_off()
			mensaje.pisar_tierra_off()
			mensaje.pisar_grama_off()
			mensaje.pisar_madera()
			mensaje.salto_dificil_off()
			mensaje.rebote_off()
			mensaje.sigilo_off()


#------pisar salto_dificil---------
	if (body.has_method("salto_dificil")):
		var mensajes_GUI = get_tree().get_nodes_in_group("player")
		for mensaje in mensajes_GUI:
			mensaje.pisar_agua_off()
			mensaje.pisar_tierra_off()
			mensaje.pisar_grama_off()
			mensaje.pisar_madera_off()
			mensaje.salto_dificil()
			mensaje.rebote_off()
			mensaje.sigilo_off()

#------pisar salto_rebote---------
	if (body.has_method("rebote")):
		var mensajes_GUI = get_tree().get_nodes_in_group("player")
		for mensaje in mensajes_GUI:
			mensaje.pisar_agua_off()
			mensaje.pisar_tierra_off()
			mensaje.pisar_grama_off()
			mensaje.pisar_madera_off()
			mensaje.salto_dificil_off()
			mensaje.rebote()
			mensaje.sigilo_off()


#------sigilo---------
	if (body.has_method("sigilo")):
		var mensajes_GUI = get_tree().get_nodes_in_group("player")
		for mensaje in mensajes_GUI:
			mensaje.pisar_agua_off()
			mensaje.pisar_tierra_off()
			mensaje.pisar_grama_off()
			mensaje.pisar_madera_off()
			mensaje.salto_dificil_off()
			mensaje.rebote_off()
			mensaje.sigilo()









#------grullir madera---------
	if (body.has_method("grullir_madera")):
		var mensajes_GUI = get_tree().get_nodes_in_group("player")
		for mensaje in mensajes_GUI:
			mensaje.grullir_madera()






#----------PREMIOS--------------

#-----------fuego 
	if (body.has_method("fuego_premio")):
		body.fuego_premio()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad()
		
		var grito = get_node("gui/splash/label")
		grito.set_text("Viva he conseguido el fuego. Lo llevare al chaman")
		
		mision_frame_fuego = 1
		gui_item_fuego()
		mision_lista = true




#-----------pluma azul
func pluma_premio(): #viene de las plumas
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad()
		
		mision_frame_pluma_azul = 1
		gui_item_pluma_azul()
		mision_lista = true
		var grito = get_node("gui/splash/label")
		grito.set_text("Pluma azul")

#-----------pluma amarilla
func pluma_premio2(): #viene de las plumas
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad()
		
		mision_frame_pluma_amarilla = 1
		gui_item_pluma_amarilla()
		mision_lista = true
		var grito = get_node("gui/splash/label")
		grito.set_text("Pluma amarilla")

#-----------pluma morada
func pluma_premio3(): #viene de las plumas
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad()
		
		mision_frame_pluma_morada = 1
		gui_item_pluma_morada()
		mision_lista = true
		var grito = get_node("gui/splash/label")
		grito.set_text("Pluma morada")		

#-----------pluma roja
func pluma_premio4(): #viene de las plumas
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad()
		
		mision_frame_pluma_roja = 1
		gui_item_pluma_roja()
		mision_lista = true
		var grito = get_node("gui/splash/label")
		grito.set_text("Pluma roja")		

#-----------pluma verde
func pluma_premio5(): #viene de las plumas
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad()
		
		mision_frame_pluma_verde = 1
		gui_item_pluma_verde()
		mision_lista = true
		var grito = get_node("gui/splash/label")
		grito.set_text("Pluma verde")


#-----------huevo
func huevo_premio(): #viene de las plumas
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad()
		
		mision_frame_huevo = 1
		gui_item_huevo()
		mision_lista = true
		var grito = get_node("gui/splash/label")
		grito.set_text("Huevo")











#--------------------------
func _on_salir_pressed():
	get_tree().quit()



func _on_ir_menu_pressed():
	get_tree().set_pause(false)
	get_tree().change_scene("res://menu/idioma/idiomas.scn")


func _on_reiniciar_pressed():
	get_tree().set_pause(false)
	get_tree().reload_current_scene()


func _on_items_pressed():
	get_node("gui/Popup_item").popup()


func _on_continuar_item_pressed():
	get_node("gui/Popup_item").hide()





#------------dialogos y misiones------viene de chaman en: _on_activate y _off_activate
func mision_0():  # lejos de todos los dialogos
	mision_n = 0


func mision_1(): # cerca del chaman 1
	mision_n = 1


func mision_2(): # cerca del chaman 2
	mision_n = 2

func mision_3(): # cerca del chaman 3
	mision_n = 3

func mision_4(): # cerca del chaman 4
	mision_n = 4

func mision_5(): # cerca del chaman 5
	mision_n = 5

func mision_6(): # cerca de otro
	mision_n = 6

func mision_7(): # cerca de otro
	mision_n = 7

#-----------------------








#-------------CUMPLIR MISIONES ENCOMENDADAS
func _on_items_mision_pressed():
	var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
	for reinicio in mensajes_GUI:
		reinicio.set_opacidad()
	fx.play("premio")

#---mensajes de advertencias de los item
	if mision_n != 1 and mision_frame_fuego ==1 and mision_item_1 == "fuego": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar este fuego al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

		# (mision_n) es una propiedad que se envia cuando se esta cerca de los dialogos
	if mision_n != 2 and mision_frame_pluma_azul == 1 and mision_item_1 == "pazul": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar esta pluma azul al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

	if mision_n != 3 and mision_frame_pluma_amarilla == 1 and mision_item_1 == "pamarilla": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar esta pluma amarilla al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

	if mision_n != 4 and mision_frame_pluma_morada == 1 and mision_item_1 == "pmorada": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar esta pluma morada al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

	if mision_n != 5 and mision_frame_pluma_roja == 1 and mision_item_1 == "proja": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar esta pluma roja al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

	if mision_n != 6 and mision_frame_pluma_verde == 1 and mision_item_1 == "pverde": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar esta pluma verde al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

	if mision_n != 7 and mision_frame_huevo == 1 and mision_item_1 == "huevo": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar este huevo al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()




#---------------- completar cada misión------------------
	if mision_n == 1 and mision_frame_fuego ==1 and mision_item_1 == "fuego": #---fuego entregado
#		mision_n = 0 # (mision_n) es una propiedad que se envia cuando se esta cerca de los dialogos
		mision_frame_fuego = 0
		mision_item_1 == ""
		mision_lista = false
		gui_item_fuego() # reinicia los frames de los item		
		entregar_pluma()
		
		get_node("dialogos_obj/chaman1").line = "gracias_fuego" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()


#-----------------
	if mision_n == 2 and mision_frame_pluma_azul ==1 and mision_item_1 == "pazul":
#		mision_n = 0
		mision_frame_pluma_azul = 0
		mision_item_1 == ""
		mision_lista = false
		gui_item_pluma_azul() # reinicia los frames de los item		
#		entregar_pluma()
		
		get_node("dialogos_obj/chaman2").line = "pazul" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()

#-----------------
	if mision_n == 3 and mision_frame_pluma_amarilla ==1 and mision_item_1 == "pamarilla":
#		mision_n = 0
		mision_frame_pluma_amarilla = 0
		mision_item_1 == ""
		mision_lista = false
		gui_item_pluma_amarilla() # reinicia los frames de los item
#		entregar_pluma()
		
		get_node("dialogos_obj/chaman3").line = "pamarilla" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()

#-----------------
	if mision_n == 4 and mision_frame_pluma_morada ==1 and mision_item_1 == "pmorada":
#		mision_n = 0
		mision_frame_pluma_morada = 0
		mision_item_1 == ""
		mision_lista = false
		gui_item_pluma_morada() # reinicia los frames de los item
#		entregar_pluma()
		
		get_node("dialogos_obj/chaman4").line = "pmorada" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()

#-----------------
	if mision_n == 5 and mision_frame_pluma_roja ==1 and mision_item_1 == "proja":
#		mision_n = 0
		mision_frame_pluma_roja = 0
		mision_item_1 == ""
		mision_lista = false
		gui_item_pluma_roja() # reinicia los frames de los item
#		entregar_pluma()
		
		get_node("dialogos_obj/chaman5").line = "proja" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()

#-----------------
	if mision_n == 6 and mision_frame_pluma_verde ==1 and mision_item_1 == "pverde":
#		mision_n = 0
		mision_frame_pluma_verde = 0
		mision_item_1 == ""
		mision_lista = false
		gui_item_pluma_verde() # reinicia los frames de los item
#		entregar_pluma()
		
		get_node("dialogos_obj/chaman6").line = "pverde" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()


#-----------------
	if mision_n == 7 and mision_frame_huevo ==1 and mision_item_1 == "huevo":
#		mision_n = 0
		mision_frame_huevo = 0
		mision_item_1 == ""
		mision_lista = false
		gui_item_huevo() # reinicia los frames de los item
#		entregar_pluma()
		
		get_node("dialogos_obj/huevo").line = "huevo_listo" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()
		var mensajes_GUI = get_tree().get_nodes_in_group("caiman_move")
		for reinicio in mensajes_GUI:
			reinicio.mover()






#---------------------------- presion sobre los item-----------------------
func _on_items_mision2_pressed(): # presion de los item  activa: presion item
	var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
	for reinicio in mensajes_GUI:
		reinicio.set_opacidad()
	fx.play("premio")




#---mensajes de advertencias de los item
	if mision_n != 1 and mision_frame_fuego ==1 and mision_item_2 == "fuego": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar este fuego al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

	if mision_n != 2 and mision_frame_pluma_azul == 1 and mision_item_2 == "pazul": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar esta pluma azul al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

	if mision_n != 3 and mision_frame_pluma_amarilla == 1 and mision_item_2 == "pamarilla": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar esta pluma amarilla al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

	if mision_n != 4 and mision_frame_pluma_morada == 1 and mision_item_2 == "pmorada": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar esta pluma morada al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

	if mision_n != 5 and mision_frame_pluma_roja == 1 and mision_item_2 == "proja": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar esta pluma roja al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

	if mision_n != 6 and mision_frame_pluma_verde == 1 and mision_item_2 == "pverde": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar esta pluma verde al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()


	if mision_n != 7 and mision_frame_huevo == 1 and mision_item_2 == "huevo": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar este huevo al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()








#---------------- completar cada misión------------------
	if mision_n == 1 and mision_frame_fuego ==1 and mision_item_2 == "fuego": #---fuego entregado
#		mision_n = 0 # (mision_n) es una propiedad que se envia cuando se esta cerca de los dialogos
		mision_frame_fuego = 0
		mision_item_2 == ""
		mision_lista = false
		gui_item_fuego() # reinicia los frames de los item		
		entregar_pluma()
		
		get_node("dialogos_obj/chaman1").line = "gracias_fuego" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()

#-----------------
	if mision_n == 2 and mision_frame_pluma_azul ==1 and mision_item_2 == "pazul":
#		mision_n = 0
		mision_frame_pluma_azul = 0
		mision_item_2 == ""
		mision_lista = false
		gui_item_pluma_azul() # reinicia los frames de los item		
#		entregar_pluma()
		
		get_node("dialogos_obj/chaman2").line = "pazul" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()

#-----------------
	if mision_n == 3 and mision_frame_pluma_amarilla ==1 and mision_item_2 == "pamarilla":
#		mision_n = 0
		mision_frame_pluma_amarilla = 0
		mision_item_2 == ""
		mision_lista = false
		gui_item_pluma_amarilla() # reinicia los frames de los item
#		entregar_pluma()
		
		get_node("dialogos_obj/chaman3").line = "pamarilla" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()

#-----------------
	if mision_n == 4 and mision_frame_pluma_morada ==1 and mision_item_2 == "pmorada":
#		mision_n = 0
		mision_frame_pluma_morada = 0
		mision_item_2 == ""
		mision_lista = false
		gui_item_pluma_morada() # reinicia los frames de los item
#		entregar_pluma()
		
		get_node("dialogos_obj/chaman4").line = "pmorada" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()

#-----------------
	if mision_n == 5 and mision_frame_pluma_roja ==1 and mision_item_2 == "proja":
#		mision_n = 0
		mision_frame_pluma_roja = 0
		mision_item_2 == ""
		mision_lista = false
		gui_item_pluma_roja() # reinicia los frames de los item
#		entregar_pluma()
		
		get_node("dialogos_obj/chaman5").line = "proja" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()

#-----------------
	if mision_n == 6 and mision_frame_pluma_verde ==1 and mision_item_2 == "pverde":
#		mision_n = 0
		mision_frame_pluma_verde = 0
		mision_item_2 == ""
		mision_lista = false
		gui_item_pluma_verde() # reinicia los frames de los item
#		entregar_pluma()
		
		get_node("dialogos_obj/chaman6").line = "pverde" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()


#-----------------
	if mision_n == 7 and mision_frame_huevo ==1 and mision_item_2 == "huevo":
#		mision_n = 0
		mision_frame_huevo = 0
		mision_item_2 == ""
		mision_lista = false
		gui_item_huevo() # reinicia los frames de los item
#		entregar_pluma()
		
		get_node("dialogos_obj/huevo").line = "huevo_listo" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()
		var mensajes_GUI = get_tree().get_nodes_in_group("caiman_move")
		for reinicio in mensajes_GUI:
			reinicio.mover()






func _on_items_mision3_pressed():
	var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
	for reinicio in mensajes_GUI:
		reinicio.set_opacidad()
	fx.play("premio")


#---mensajes de advertencias de los item
	if mision_n != 1 and mision_frame_fuego ==1 and mision_item_3 == "fuego": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar este fuego al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

	if mision_n != 2 and mision_frame_pluma_azul == 1 and mision_item_3 == "pazul": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar esta pluma azul al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

	if mision_n != 3 and mision_frame_pluma_amarilla == 1 and mision_item_3 == "pamarilla": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar esta pluma amarilla al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

	if mision_n != 4 and mision_frame_pluma_morada == 1 and mision_item_3 == "pmorada": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar esta pluma morada al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

	if mision_n != 5 and mision_frame_pluma_roja == 1 and mision_item_3 == "proja": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar esta pluma roja al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()

	if mision_n != 6 and mision_frame_pluma_verde == 1 and mision_item_3 == "pverde": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar esta pluma verde al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()


	if mision_n != 7 and mision_frame_huevo == 1 and mision_item_3 == "huevo": # lejos de los dialogos
		var grito = get_node("gui/splash/label")
		grito.set_text("Umm.. debo llevar este huevo al lugar correcto")
		var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.end_dialog()





#---------------- completar cada misión------------------
	if mision_n == 1 and mision_frame_fuego ==1 and mision_item_3 == "fuego": #---fuego entregado
#		mision_n = 0 # (mision_n) es una propiedad que se envia cuando se esta cerca de los dialogos
		mision_frame_fuego = 0
		mision_item_3 == ""
		mision_lista = false
		gui_item_fuego() # reinicia los frames de los item		
		entregar_pluma()
		
		get_node("dialogos_obj/chaman1").line = "gracias_fuego" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()

#-----------------
	if mision_n == 2 and mision_frame_pluma_azul ==1 and mision_item_3 == "pazul":
#		mision_n = 0
		mision_frame_pluma_azul = 0
		mision_item_3 == ""
		mision_lista = false
		gui_item_pluma_azul() # reinicia los frames de los item		
#		entregar_pluma()
		
		get_node("dialogos_obj/chaman2").line = "pazul" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()

#-----------------
	if mision_n == 3 and mision_frame_pluma_amarilla ==1 and mision_item_3 == "pamarilla":
#		mision_n = 0
		mision_frame_pluma_amarilla = 0
		mision_item_3 == ""
		mision_lista = false
		gui_item_pluma_amarilla() # reinicia los frames de los item
#		entregar_pluma()
		
		get_node("dialogos_obj/chaman3").line = "pamarilla" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()

#-----------------
	if mision_n == 4 and mision_frame_pluma_morada ==1 and mision_item_3 == "pmorada":
#		mision_n = 0
		mision_frame_pluma_morada = 0
		mision_item_3 == ""
		mision_lista = false
		gui_item_pluma_morada() # reinicia los frames de los item
#		entregar_pluma()
		
		get_node("dialogos_obj/chaman4").line = "pmorada" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()

#-----------------
	if mision_n == 5 and mision_frame_pluma_roja ==1 and mision_item_3 == "proja":
#		mision_n = 0
		mision_frame_pluma_roja = 0
		mision_item_3 == ""
		mision_lista = false
		gui_item_pluma_roja() # reinicia los frames de los item
#		entregar_pluma()
		
		get_node("dialogos_obj/chaman5").line = "proja" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()

#-----------------
	if mision_n == 6 and mision_frame_pluma_verde ==1 and mision_item_3 == "pverde":
#		mision_n = 0
		mision_frame_pluma_verde = 0
		mision_item_3 == ""
		mision_lista = false
		gui_item_pluma_verde() # reinicia los frames de los item
#		entregar_pluma()
		
		get_node("dialogos_obj/chaman6").line = "pverde" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()


#-----------------
	if mision_n == 7 and mision_frame_huevo ==1 and mision_item_3 == "huevo":
#		mision_n = 0
		mision_frame_huevo = 0
		mision_item_3 == ""
		mision_lista = false
		gui_item_huevo() # reinicia los frames de los item
#		entregar_pluma()

		get_node("dialogos_obj/huevo").line = "huevo_listo" # asigna un nuevo dialogo al chaman
		var dialogo = get_tree().get_nodes_in_group("dialogos") # actualiza el dialogo del chaman
		for dialo in dialogo:
			dialo.ver_dialogo()
		var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
		for reinicio in mensajes_GUI:
			reinicio.set_opacidad_off()
		var mensajes_GUI = get_tree().get_nodes_in_group("caiman_move")
		for reinicio in mensajes_GUI:
			reinicio.mover()






#-------ENTREGA  DE  PLUMA POR EL CHAMAN ----------
func entregar_pluma():
		var pluma = import_pluma.instance()
#		pluma.set_name("pluma")
		pluma.set_pos(get_node("dialogos_obj/chaman1/Position2D").get_global_pos())
		add_child(pluma)

		var check = checkpoint2.instance()
#		pluma.set_name("pluma")
		check.set_pos(get_node("dialogos_obj/chaman1/Position2D_nex").get_global_pos())
		add_child(check)








