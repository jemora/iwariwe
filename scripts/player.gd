### todo
 #setup Statemachine
 #left/right rotation
 #doublejump
extends RigidBody2D

var input_states = preload("res://scripts/input_states.gd")




export var player_speed = 200
export var jumpforce = 50
export var acceleration = 7
export var air_acceleration = 1
export var extra_gravity = 400

var PLAYERSTATE_PREV = ""
var PLAYERSTATE = ""
var PLAYERSTATE_NEXT = "ground"

var ORIENTATION_PREV = ""
var ORIENTATION = ""
var ORIENTATION_NEXT = "right"

var raycast_down = null

var current_speed = Vector2(0,0)

var rotate = null
var jumping = 0

var btn_right = input_states.new("btn_right")
var btn_left = input_states.new("btn_left")
var btn_jump = input_states.new("btn_jump")

var btn_action = input_states.new("accion")
var close_text = input_states.new("btn_jump")







var anim_player = null
var anim = ""
var anim_new = ""
var anim_speed = 1.0
var anim_blend = 0.2

var sonidoplayer
var fx

var talking = true
var sonidolisto
var Timer_reinicio
var text_mensaje = false
var vigilar_on = 1
var salto = 0
var timer_salto = 0
var timer_pasos
var pasos = false
var agua = false
var tierra = false
var grama = false
var madera = false
var salto_dificil = false
var grito_caida = false
var aire = 0
var rebote = false
var sigilo = false
var rebote_planta = 500

var offset
export var offset_x_velocidad = 3


export var offset_y_up_limite = 750
export var offset_y_down_limite = 600

var offset_x = 700
var offset_y = 750
var direccion_player = 1 # 1 equivale a derecha

var camara_limite
var player_tipo = 2




func move(speed, acc, delta):
	current_speed.x = lerp(current_speed.x , speed, acc * delta)
	set_linear_velocity(Vector2(current_speed.x,get_linear_velocity().y))

func is_on_ground():
	if raycast_down.is_colliding():
		return true
	else:
		return false

func _ready():

#	get_node("Camera2D").set_zoom(get_node("Camera2D").get_zoom() * get_node("/root/global").viewport_scale)

#	camara_limite = get_node("Camera2D")



	raycast_down = get_node("RayCast2D")
	raycast_down.add_exception(self)
	rotate = get_node("rotate")
	add_to_group("player")

#-----Lista de sonidos Sonidos
	sonidoplayer = get_node("SamplePlayer2D")
	fx = get_node("SamplePlayer2D_reinicio")
	timer_pasos = get_owner().get_node("Timer_pasos")
	timer_pasos.connect('timeout',self,'sonido_pasos')





	set_process(true)

	
	# Initalization here
	set_fixed_process(true)
	set_applied_force(Vector2(0,extra_gravity))
#	set_integrate_forces(true)
	
	if player_tipo == 1:
		anim_player = get_node("rotate/character_sprites/AnimationPlayer")
#		get_node("rotate/character_sprites 2").hide()
		get_node("rotate/character_sprites 2").queue_free()
		
	if player_tipo == 2:
		anim_player = get_node("rotate/character_sprites 2/AnimationPlayer")
		get_node("rotate/character_sprites").queue_free()
#		get_node("rotate/character_sprites").hide()



	sonidolisto = get_node("SamplePlayer2D_reinicio")
#	Timer_reinicio = get_owner().get_node("Timer_reinicio") 
#	get_owner().get_node("fuego").connect("body_enter", get_node("player"), "_on_Timer_reinicio_timeout")

#	print(salto_dificil)

func _process(delta):
	offset = get_node("Camera2D").set_offset(Vector2 (-offset_x, -offset_y))
#	camara_limite = get_node("Camera2D").set_limit(-1000, -1000)

# eje x, el eje ( y) esta en la variable de: en aire, en tierra del actor
	if btn_right.check() == 2:
		direccion_player = 1
	if direccion_player == 1:
		if offset_x > 300:
			offset_x -= offset_x_velocidad

	if btn_left.check() == 2:
		direccion_player = 0
	if direccion_player == 0:
		if offset_x < 1000:
			offset_x += offset_x_velocidad


	print(camara_limite)





func sonido_pasos(): # viene de timer_pasos

	if pasos == true:
		if agua == true:
			fx.play("camino_agua")
			
		if tierra == true:
			sonidoplayer.play("pasos_tierra")
			
		if grama == true:
			fx.play("pisada_hojas")
			
		if madera == true:
			fx.play("pasos")
	
		if rebote == true:
			fx.play("pasos_tierra")

		if salto_dificil == true:
			fx.play("pasos_tierra")


func rotate_behavior():
	if ORIENTATION == "right" and ORIENTATION_NEXT == "left":
		rotate.set_scale(rotate.get_scale() * Vector2(-1,1))
	elif ORIENTATION == "left" and ORIENTATION_NEXT == "right":
		rotate.set_scale(rotate.get_scale() * Vector2(-1,1))
		


func mensaje_off():
	text_mensaje = false
func mensaje_on():
	text_mensaje = true

func pisar_agua():
	agua = true
#	sonidoplayer.play("pancada_agua") pisar_agua
	
func pisar_agua_off():
	agua = false

func pisar_tierra():
	tierra = true
func pisar_tierra_off():
	tierra = false

func pisar_grama():
	grama = true
func pisar_grama_off():
	grama = false

func pisar_madera():
	madera = true
func pisar_madera_off():
	madera = false

func salto_dificil():
	salto_dificil = true
func salto_dificil_off():
	salto_dificil = false

func rebote():
	rebote = true
func rebote_off():
	rebote = false

func sigilo():
	sigilo = true
func sigilo_off():
	sigilo = false

func grullir_madera():
	sonidoplayer.play("grullido_madera")





func _fixed_process(delta):
	
	PLAYERSTATE_PREV = PLAYERSTATE
	PLAYERSTATE = PLAYERSTATE_NEXT
	
	ORIENTATION_PREV = ORIENTATION
	ORIENTATION = ORIENTATION_NEXT







#--------DISTANCIA DEL ACTOR CON LOS DIALOGOS------
	
	var dialogo = get_tree().get_nodes_in_group("dialogos")
	for dialo in dialogo:
		var dpos = self.get_pos() - dialo.get_pos()
		var dist = sqrt(dpos.x * dpos.x + dpos.y*dpos.y)
		
		if dist<250 and talking == true: # and btn_action.check() == 1:
			dialo._on_activate()
			talking = false
			
		if dist>350 and (close_text.check() == 2 or btn_right.check() == 2 or btn_left.check() == 2):
			dialo._off_activate()
			talking = true




#--------DISTANCIA DE LOS PORECITOS------
#	var vigilar_on = get_owner().get_node("elementos/poresito").vigilar_on
	
#	var poresitos = get_tree().get_nodes_in_group("tela_arana")
#	for pore in poresitos:
#		var dpos = self.get_pos() - pore.get_pos()
#		var dist = sqrt(dpos.x * dpos.x + dpos.y*dpos.y)
		
#		if dist<500 and vigilar_on == 1: # and btn_action.check() == 1:
#			Timer_reinicio.start()
#			pore.alertar()
#			get_tree().reload_current_scene()





	#----OCULTA LOS MENSAJES CON FADE-------- EN SPLASH
	var mensajes = get_tree().get_nodes_in_group("mensajes_GUI")
	for mens in mensajes:
		if  close_text.check() == 2 or btn_right.check() == 2 or btn_left.check() == 2:
			mens.ocultar()


#--------------------------------  



#	print("salto ",salto, " - ", timer_salto, " - ", " aire ", aire)
#	print(tierra, agua, madera, salto_dificil, rebote, grama, sigilo)
#	print(agua)




#------suena los pasos cuando se mueve------------
	if btn_left.check() == 2 and aire == 0 and salto == 0 or btn_right.check() == 2 and aire == 0 and salto == 0:
	
	

		if pasos == false:
			if tierra == true:
				fx.play("pasos_tierra")

		if pasos == false:
			if agua == true:
				fx.play("camino_agua")

		if pasos == false:
			if grama == true:
				fx.play("pisada_hojas")

		if pasos == false:
			if madera == true:
				fx.play("pasos")

		if pasos == false:
			if rebote == true:
				fx.play("pasos_tierra")

		if pasos == false:
			if salto_dificil == true:
				fx.play("pasos_tierra")

#-----------------------------------






#-----grito caida libre sin saltar-----------
	if aire == 1 and grito_caida == false and timer_salto > 50 and timer_salto < 60:
		if salto == 0:
			sonidoplayer.play("grito_corto")
			grito_caida = true
			salto = 1
#			timer_salto = 0 grito_corto


#-----grito caida libre saltando-----------
	if aire == 1 and grito_caida == false and timer_salto > 60 and timer_salto < 80:
		if salto == 1:
			sonidoplayer.play("salto_dificil")
			grito_caida = true
			salto = 1
#			timer_salto = 0








	if PLAYERSTATE == "ground":
		ground_state(delta)
		if offset_y < offset_y_up_limite:
			offset_y += 1
		
	elif PLAYERSTATE == "air":
		air_state(delta)
		if offset_y > offset_y_down_limite:
			offset_y -= 3
		
	if anim != anim_new:
		anim_new = anim
		anim_player.play(anim,anim_blend,anim_speed)




func ground_state(delta):

	if btn_left.check() == 2:
		direccion_player = 0
		
		move(-player_speed, acceleration, delta)
		ORIENTATION_NEXT = "left"
		
		if agua == false or sigilo == false:
			anim = "run"
			anim_speed = 2.0
			player_speed = 500

		if agua == true:
			anim = "run"
			anim_speed = 0.5
			player_speed = 300
		anim_blend = 0.2

		if sigilo == true:
			anim = "run"
			anim_speed = 0.8
			player_speed = 300
		anim_blend = 0.2


	elif btn_right.check() == 2:

		move(player_speed, acceleration, delta)
		ORIENTATION_NEXT = "right"
		
		if agua == false or sigilo == false:
			anim = "run"
			anim_speed = 2.0
			player_speed = 500

		if agua == true:
			anim = "run"
			anim_speed = 0.5
			player_speed = 300
		anim_blend = 0.2

		if sigilo == true:
			anim = "run"
			anim_speed = 0.8
			player_speed = 300
		anim_blend = 0.2


	else:
		move(0, acceleration, delta)
		anim = "idle"
		pasos = false
		anim_speed = .5
		anim_blend = 0.2
		player_speed = 550
		pasos = false
		timer_pasos.stop()








	
	rotate_behavior()
	
	if is_on_ground():
#		timer_salto = 0
		grito_caida = false
		
#		if timer_salto < 30:
#			aire = 0
		aire = 0



		
		if btn_jump.check() == 1:
			set_axis_velocity(Vector2(0,-jumpforce))
			jumping = 1
			
			

#-----sonido al saltar---------
			if tierra == true:
				sonidoplayer.play("mujido_salto_corto")
			if agua == true:
				sonidoplayer.play("pujido_agua")
			if grama == true:
				sonidoplayer.play("mujido_salto_corto")
			if madera == true:
				sonidoplayer.play("mujido_salto_corto")
			if salto_dificil == true:
				sonidoplayer.play("salto_dificil")
			if rebote == true:
				sonidoplayer.play("mujido_salto_corto")



#----sonido caida-------
		if tierra == true:
			if salto == 1 and timer_salto > 10 and timer_salto < 59:
				sonidoplayer.play("pasos_tierra")
				salto = 0
				timer_salto = 0
		
			if salto == 1 and timer_salto > 60 and timer_salto < 100:
				sonidoplayer.play("caida_media")
				salto = 0
				timer_salto = 0
	
			if salto == 1 and timer_salto > 100:
				sonidoplayer.play("caida_salto_largo")
				salto = 0
				timer_salto = 0

		if agua == true:
			if salto == 1 and timer_salto > 10 and timer_salto < 59:
				sonidoplayer.play("pancada_agua")
				salto = 0
				timer_salto = 0
		
			if salto == 1 and timer_salto > 60 and timer_salto < 100:
				sonidoplayer.play("pancada_agua")
				salto = 0
				timer_salto = 0
	
			if salto == 1 and timer_salto > 100:
				sonidoplayer.play("pancada_agua")
				salto = 0
				timer_salto = 0
			if salto == 0 and timer_salto > 100:
				sonidoplayer.play("pancada_agua")
				salto = 1

		if grama == true:
			if salto == 1 and timer_salto > 10 and timer_salto < 59:
				sonidoplayer.play("pisada_hojas")
				salto = 0
				timer_salto = 0
		
			if salto == 1 and timer_salto > 60 and timer_salto < 100:
				sonidoplayer.play("caida_media")
				salto = 0
				timer_salto = 0
	
			if salto == 1 and timer_salto > 100:
				sonidoplayer.play("caida_salto_largo")
				salto = 0
				timer_salto = 0

		if madera == true:
			if salto == 1 and timer_salto > 10 and timer_salto < 59:
				sonidoplayer.play("pasos")
				salto = 0
				timer_salto = 0
		
			if salto == 1 and timer_salto > 60 and timer_salto < 100:
				sonidoplayer.play("caida_media")
				salto = 0
				timer_salto = 0
	
			if salto == 1 and timer_salto > 100:
				sonidoplayer.play("caida_salto_largo")
				salto = 0
				timer_salto = 0

		if salto_dificil == true:
			if salto == 1 and timer_salto > 10 and timer_salto < 59:
				sonidoplayer.play("pasos_tierra")
				salto = 0
				timer_salto = 0
		
			if salto == 1 and timer_salto > 60 and timer_salto < 100:
				sonidoplayer.play("caida_media")
				salto = 0
				timer_salto = 0
	
			if salto == 1 and timer_salto > 100:
				sonidoplayer.play("caida_salto_largo")
				salto = 0
				timer_salto = 0

		if rebote == true:
			if salto == 1 and timer_salto > 10 and timer_salto < 59:
				sonidoplayer.play("pasos_tierra")
				salto = 0
				timer_salto = 0
		
			if salto == 1 and timer_salto > 60 and timer_salto < 100:
				sonidoplayer.play("pasos_tierra")
				salto = 0
				timer_salto = 0
	
			if salto == 1 and timer_salto > 100:
				sonidoplayer.play("caida_salto_largo")
				salto = 0
				timer_salto = 0



		if btn_left.check() == 2 or btn_right.check() == 2:
			if pasos == false:
				pasos = true
				timer_pasos.start()


#------indica esta en el aire----se desactiva en el suelo
		if btn_jump.check() == 2 or btn_jump.check() == 1:
#			aire = 1
			salto = 1






	else:
		PLAYERSTATE_NEXT = "air"

	


func air_state(delta):

	timer_salto += 1
	timer_pasos.stop()
	pasos = false
	if timer_salto > 5:
		aire = 1






	if btn_left.check() == 2:
		move(-player_speed, air_acceleration, delta)
		ORIENTATION_NEXT = "left"
	elif btn_right.check() == 2:
		move(player_speed, air_acceleration, delta)
		ORIENTATION_NEXT = "right"
	else:
		move(0, air_acceleration, delta)
	
	if btn_jump.check() == 1 and jumping == 1:
		set_axis_velocity(Vector2(0,-jumpforce))
		jumping += 1
		sonidoplayer.play("salto_aire")
		
		
	
	if get_linear_velocity().y > 0:
		anim = "jump_down"
		anim_speed = 1.0
	else:
		anim = "jump_up"
		anim_speed = 1.0
		anim_blend = 0.0
	
	rotate_behavior()
	if is_on_ground():
		PLAYERSTATE_NEXT = "ground"
	
#-----grito caida libre al saltar-----------









func _reiniciar_sonido_player():
	sonidolisto.play("vida")

	var gui = get_tree().get_nodes_in_group("mensajes_GUI")
	for idioma in gui:
		idioma.reiniciar_grito()
		idioma.set_opacidad()





#func _on_Timer_reinicio_timeout():
#	get_tree().reload_current_scene()
	
#	get_tree().reload_current_scene()
#	get_tree().quit()
#	get_tree().change_scene("res://idiomas.scn")





#func _on_fuego_body_enter( body ):
#	get_tree().reload_current_scene()

func rebote_planta():
	set_axis_velocity(Vector2(0,-rebote_planta))
	salto = 1
	aire = 1
	jumping = 1






func _on_player_body_enter( body ):
	pass # replace with function body
