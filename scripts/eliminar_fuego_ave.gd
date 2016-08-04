
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here



	get_node("RigidBody2D").connect("body_enter", get_node("StaticBody2D"), "eliminar")
#	get_node("RigidBody2D").connect("body_enter",self,"eliminar")



func eliminar():
	queue_free()
	get_owner().get_node("RigidBody2D").queue_free()




func _on_RigidBody2D_body_enter( body ):
	queue_free()
	get_owner().get_node("RigidBody2D").queue_free()
