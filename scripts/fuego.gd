
extends RigidBody2D



var WALK_SPEED = 200
var current_speed = Vector2(0,0)
var Time
var Time2
var player


func _ready():
	get_node("fx").play("fuego")
	get_node("fx1").play("explosion_magia")
#	move(true)
	pass
	

#func move(delta):
#	set_axis_velocity(Vector2(-100,-30))
#	set_linear_velocity(Vector2(WALK_SPEED.x,get_linear_velocity().y))
#	pass
	


func fuego_premio():
	var timer = get_node("Timer")
	timer.connect("timeout", self, "queue_free")
	timer.start()
	
#	get_tree().reload_current_scene()
	var fx = get_node("fx")
	fx.play("premio2")
#	get_node("explotar").show()
