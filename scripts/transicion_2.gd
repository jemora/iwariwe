
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var input_states = preload("res://scripts/input_states.gd")
var btn_action = input_states.new("accion")
var historia = 1




func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)



func _process(delta):
	if  btn_action.check() == 1:
		_on_TouchScreenButton_pressed()

	get_node("cargar").rotate(3.0)




func _on_TouchScreenButton_pressed():
	get_node("cargar").show()
	var time = get_node("Timer")
	time.start()
	time.set_wait_time(0.1)
	time.connect('timeout',self,'nueva_escena')
	get_node("fx").play("papel2")

	
func nueva_escena():
	get_tree().change_scene("res://niveles/level_02_b.scn")
	
	




















