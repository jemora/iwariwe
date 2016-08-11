
extends Node2D

var timer
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
		timer = get_node("Timer")
		timer.connect('timeout',self,'cargar')




func _on_nivel_uno_verde_pressed():
		timer.start()
		get_node("Label").show()
		get_node("cargar").show()



func cargar():
	get_tree().change_scene("res://niveles/level_01_a.xml")