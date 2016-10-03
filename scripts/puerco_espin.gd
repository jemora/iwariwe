
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var accion = 1
var accion_tipe = 1
var parar
export var timer_parar = 1
var parado
export var timer_parado = 1
var reposar
export var timer_reposar = 1

var orientacion = 1

func _ready():


	parar = get_node("rotor/puerco/Timer_caminar")
	parar.set_wait_time(timer_parar)
	parar.connect('timeout',self,'parar')

	parado = get_node("rotor/puerco/Timer_erizar")
	parado.set_wait_time(timer_parado)
	parado.connect('timeout',self,'caminar')

	reposar = get_node("rotor/puerco/Timer_reposar")
	reposar.set_wait_time(timer_reposar)
	reposar.connect('timeout',self,'reposar')


	set_process(true)
	
func _process(delta):
	if accion_tipe == 1:
		set_mode(MODE_CHARACTER)
		
		if orientacion == 1:
			set_linear_velocity(Vector2(200, 0))
			
		if orientacion == 0:
			set_linear_velocity(Vector2(-200, 0))

		
		if accion == 1:
			parar.start()
			accion = 0
			get_node("rotor/puerco/AnimationPlayer").play("caminar")




func parar():
	set_mode(MODE_STATIC)
	accion_tipe = 0

	get_node("rotor/puerco/AnimationPlayer").play("erizar")
	parar.stop()
	parado.start()
	reposar.start()
	
	
func reposar():
	get_node("rotor/puerco/AnimationPlayer").play("reposar")
	reposar.stop()
	
	
func caminar():
	accion_tipe = 1
	accion = 1
	
	if orientacion == 1:
		orientacion = 0
		var rotor = get_node("rotor")
		rotor.set_scale(Vector2(-1,1))

	elif orientacion == 0:
		orientacion = 1
		var rotor = get_node("rotor")
		rotor.set_scale(Vector2(1,1))



func puerco():
	pass



