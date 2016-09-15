
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var ramas

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	ramas = get_node("AnimationPlayer")
	
	
func _process(delta):
#	ramas.play("ramas")
	pass


