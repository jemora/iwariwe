
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"
export var accion_y = 1
var lado = 0
var centrar = 0
var centrar_on = null

var timer_y
var timer_y_on = 1
var timer_x
var timer_x_centrar

func _ready():
	add_to_group("madera")

	set_process(true)
	
	timer_y = get_node("Timer_y")
	timer_y.connect('timeout',self,'parar_y')

	timer_x = get_node("Timer_x")
	timer_x.connect('timeout',self,'parar_x')

	timer_x_centrar = get_node("Timer_x_centrar")
	timer_x_centrar.connect('timeout',self,'centrar_timer')




#	arriba()
#	abajo()
#	izquierda()
#	derecha()

func _process(delta):

# ------- centrar ----------





#---------Eje X ------------
	if lado == 1:
		get_node("Area2D/plataforma").rotate(0.02)

	if lado == 2:
		get_node("Area2D/plataforma").rotate(-0.02)

func izquierda():
	if lado == 0:
		lado = 1
		timer_x.start()
		get_node("SamplePlayer2D").play("balanza")

func derecha():
	if lado == 0:
		lado = 2
		timer_x.start()
		get_node("SamplePlayer2D").play("balanza")




# Eje Y ----------

func arriba():
	if timer_y_on == 1:
		timer_y_on = 0
		if accion_y == 1:
			set_mode(MODE_CHARACTER)
			set_linear_velocity(Vector2(0, -150))
			timer_y.start()
	
		if accion_y == 2:
			set_mode(MODE_CHARACTER)
			set_linear_velocity(Vector2(0, 150))
			timer_y.start()





#------Parar---------

func parar_y():
	if accion_y == 1:
		accion_y = 2

	elif accion_y == 2:
		accion_y = 1


	set_mode(MODE_STATIC)
	timer_y.stop()
	timer_y_on = 1




func parar_x():
	timer_x.stop()
	centrar()

	if lado == 1:
#		centrar = 1
		lado = 2

	elif lado == 2:
#		centrar = 2
		lado = 1



# ----- Centrar ---------

func centrar():
	timer_x_centrar.start()



func centrar_timer():
	timer_x_centrar.stop()
#	centrar_on = 0
#	centrar = 0
	lado = 0
	get_node("Area2D/plataforma").set_rot(0.0)



func madera():
	pass






