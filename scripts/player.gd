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

var talking = true
var sonidolisto
var Timer_reinicio
var text_mensaje = false
var vigilar_on = 1
var salto = 0
var timer_salto = 0
var timer_pasos
var pasos = false

func move(speed, acc, delta):
	current_speed.x = lerp(current_speed.x , speed, acc * delta)
	set_linear_velocity(Vector2(current_speed.x,get_linear_velocity().y))

func is_on_ground():
	if raycast_down.is_colliding():
		return true
	else:
		return false

func _ready():
	get_node("Camera2D").set_zoom(get_node("Camera2D").get_zoom() * get_node("/root/global").viewport_scale)

	raycast_down = get_node("RayCast2D")
	raycast_down.add_exception(self)
	rotate = get_node("rotate")
	add_to_group("player")

#-----Lista de sonidos Sonidos
	sonidoplayer = get_node("SamplePlayer2D")
	timer_pasos = get_owner().get_node("Timer_pasos")
	timer_pasos.connect('timeout',self,'sonido_pasos')




	
	# Initalization here
	set_fixed_process(true)
	set_applied_force(Vector2(0,extra_gravity))
#	set_integrate_forces(true)
	
	anim_player = get_node("rotate/character_sprites/AnimationPlayer")

	sonidolisto = get_node("SamplePlayer2D_reinicio")
#	Timer_reinicio = get_owner().get_node("Timer_reinicio") 
#	get_owner().get_node("fuego").connect("body_enter", get_node("player"), "_on_Timer_reinicio_timeout")

#	print(text_mensaje)


func sonido_pasos():
	sonidoplayer.play("pasos")






func rotate_behavior():
	if ORIENTATION == "right" and ORIENTATION_NEXT == "left":
		rotate.set_scale(rotate.get_scale() * Vector2(-1,1))
	elif ORIENTATION == "left" and ORIENTATION_NEXT == "right":
		rotate.set_scale(rotate.get_scale() * Vector2(-1,1))
		


func mensaje_off():
	text_mensaje = false

func mensaje_on():
	text_mensaje = true


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



#	print(pasos)








	if PLAYERSTATE == "ground":
		ground_state(delta)
	elif PLAYERSTATE == "air":
		air_state(delta)
		
	if anim != anim_new:
		anim_new = anim
		anim_player.play(anim,anim_blend,anim_speed)




func ground_state(delta):

	if btn_left.check() == 2:
		move(-player_speed, acceleration, delta)
		ORIENTATION_NEXT = "left"
		anim = "run"
		anim_speed = 2.0
		anim_blend = 0.2

		
	elif btn_right.check() == 2:
		move(player_speed, acceleration, delta)
		ORIENTATION_NEXT = "right"
		anim = "run"
		anim_speed = 2.0
		anim_blend = 0.2


	else:
		move(0, acceleration, delta)
		anim = "idle"
		pasos = false
		anim_speed = .5
		anim_blend = 0.2
		pasos = false
		timer_pasos.stop()







	
	rotate_behavior()
	
	if is_on_ground():
		salto = 1


		if btn_jump.check() == 1:
			set_axis_velocity(Vector2(0,-jumpforce))
			jumping = 1
			
			sonidoplayer.play("mujido_salto_corto")
			

#----sonido caida-------
		if salto == 1 and timer_salto > 10 and timer_salto < 59:
			sonidoplayer.play("pasos")
			salto = 0
			timer_salto = 0
	
		if salto == 1 and timer_salto > 60 and timer_salto < 119:
			sonidoplayer.play("caida_media")
			salto = 0
			timer_salto = 0

		if salto == 1 and timer_salto > 120:
			sonidoplayer.play("caida_salto_largo")
			salto = 0
			timer_salto = 0


		if btn_left.check() == 2 or btn_right.check() == 2:
			if pasos == false:
				pasos = true
				timer_pasos.start()




	else:
		PLAYERSTATE_NEXT = "air"




func air_state(delta):
	print(timer_salto)
	salto = 1
	timer_salto += 1
	timer_pasos.stop()
	pasos = false

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







func _on_player_body_enter( body ):
	pass # replace with function body
