
extends RigidBody2D

var activo = false
var tiempo
var tiempo_reubicar
var items
var frame = 1
var escala = 1
var animacion
var elementos
var timer_sms_saco


func _ready():
	add_to_group("add_premio")
	set_process(true)
	tiempo = get_node("Timer_add")
	tiempo.connect('timeout',self,'mover_premios')
	
	tiempo_reubicar = get_node("tiempo_reubicar")
	tiempo_reubicar.connect('timeout',self,'reubicar')

	timer_sms_saco = get_node("timer_sms_saco")
	timer_sms_saco.connect('timeout',self,'_saco')

#	items = get_node("elementos")
	animacion = get_node("AnimationPlayer")
	elementos = get_node("elementos")
	
	
#	activar()
	



func _process(delta):
	
#	print(frame)
	elementos.set_frame(frame)
		
	if activo == true:
		if escala > 0.5: # limita hasta donde se escalara para que no se invierta alreves la imagen
			escala -= 0.08 # escala gradualmente la imagen
		set_mode(MODE_CHARACTER) # activa el nodo principal a caracter para que funcione el desplazamiento
		set_linear_velocity(Vector2(-1800, -600)) # mueve el nodo principal
		elementos.set_scale(Vector2(escala, escala)) # escala el spriter solo
		
		

func activar():
	show()
	tiempo.start()
	tiempo_reubicar.start()
	timer_sms_saco.start()
	set_pos(Vector2(480, 200))
	animacion.play("aro")
	
	


func mover_premios():
	activo = true
	timer_sms_saco.start()

	
	
func reubicar():
	escala = 1
	tiempo.stop()
	tiempo_reubicar.stop()
	timer_sms_saco.stop()
	activo = false
	set_mode(MODE_STATIC)
	set_pos(Vector2(480, 200))
	elementos.set_scale(Vector2(escala, escala))
	frame = 1
	animacion.stop_all()
	hide()
#	_saco()


func _saco(): # envia un mensaje al saquito para que tilile cuando añade un elemento nuevo
	var mensajes = get_tree().get_nodes_in_group("saco")	
	for sms in mensajes:
		sms.sms_saco()

