
extends Node2D

var fundido
export var fundido_opacidad = 0.01
var opacidad_trans =1
var fundido_active = 0
var timer


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	fundido = get_node("negro")
	fundido.get_self_opacity()
	timer = get_node("Timer")
	timer.connect("timeout", self, ("active_off"))
	show()
	
	set_process(true)
	
	
func _process(delta):
	
	
	if fundido_active == 1:
		opacidad_trans += fundido_opacidad
		fundido.set_self_opacity(opacidad_trans)
	
	if fundido_active == 0:
		if opacidad_trans > 0.0:
			opacidad_trans -= fundido_opacidad
			fundido.set_self_opacity(opacidad_trans)
		

func active_off():
	fundido_active = 0
