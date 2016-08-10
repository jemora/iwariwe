
extends RigidBody2D

var activo = false
var tiempo
var tiempo_reubicar
var items
var frame = 0
var escala = 1
var animacion

func _ready():
	add_to_group("add_premio")
	set_process(true)
	tiempo = get_node("Timer_add")
	tiempo.connect('timeout',self,'mover_premios')
	
	tiempo_reubicar = get_node("tiempo_reubicar")
	tiempo_reubicar.connect('timeout',self,'reubicar')
	
	items = get_node("Sprite")
	animacion = get_node("AnimationPlayer")
	
	
	
#	activar()
	



func _process(delta):
#	print(frame)
	items.set_frame(frame)
		
	if activo == true:
		
		escala -= 0.05
		set_mode(MODE_CHARACTER)
		set_linear_velocity(Vector2(-1800, -600))
		set_scale(Vector2(escala, escala))
		
		

func activar():
	show()
	tiempo.start()
	tiempo_reubicar.start()
	set_pos(Vector2(480, 200))
	animacion.play("aro")
	
	


func mover_premios():
	activo = true
	

	
	
func reubicar():
	escala = 1
	tiempo.stop()
	tiempo_reubicar.stop()
	activo = false
	set_mode(MODE_STATIC)
	set_pos(Vector2(480, 200))
	set_scale(Vector2(escala, escala))
	frame = 1
	animacion.stop_all()
	hide()





