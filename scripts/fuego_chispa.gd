
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var WALK_SPEED = 20
var current_speed = Vector2(0,0)


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	set_axis_velocity(Vector2(0,-WALK_SPEED))
	
func move(speed, acc, delta):
	current_speed.x = lerp(current_speed.x , speed, acc * delta)
	set_linear_velocity(Vector2(current_speed.x,get_linear_velocity().y))
# set_axis_velocity(Vector2(0,-WALK_SPEED))