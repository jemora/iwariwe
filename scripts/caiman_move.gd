
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var mover = false




func _ready():
	add_to_group("caiman_move")
	set_process(true)
#	mover()
	set_mode(MODE_STATIC)


func mover():
	mover = true
	var timer = get_owner().get_node("Timer_parar")
	timer.start()
	timer.connect('timeout',self,'parar')
	var dialogo = get_tree().get_nodes_in_group("caiman")
	for dialo in dialogo:
		dialo.girar()
	


func parar():
	set_mode(MODE_STATIC)
	mover = false
	


func _process(delta):
	if mover == true:
		set_mode(MODE_CHARACTER)
		set_linear_velocity(Vector2(361, -021))