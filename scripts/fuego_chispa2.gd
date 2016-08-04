
extends RigidBody2D



var WALK_SPEED = 200
var current_speed = Vector2(0,0)
var Time
var Time2
var player


func _ready():

	move(true)
	
	Time = get_node("Timer").connect("timeout", self , "delete")
	Time = get_node("Timer")	
	Time.start()

	Time2 = get_node("Timer 2").connect("timeout", self , "delete2")
	Time2 = get_node("Timer 2")
	Time2.start()
	
	add_to_group("fuego")
	
	var fx = get_node("fx")
	fx.play("vida")


func eliminar():
#	queue_free()
	get_tree().reload_current_scene()


func move(delta):
	set_axis_velocity(Vector2(-100,-30))
#	set_linear_velocity(Vector2(WALK_SPEED.x,get_linear_velocity().y))
#	pass
	
func delete():
	get_node("explotar").hide()
	Time.stop()


func delete2():
	get_node("fuego").queue_free()
	Time2.stop()
	queue_free()




func _on_VisibilityNotifier2D_exit_screen():
#	pass # replace with function body
	queue_free()
#	get_tree().reload_current_scene()



func destroy():
	var timer = get_node("Timer")
	timer.connect("timeout", self, "queue_free")
	timer.start()
	
#	get_tree().reload_current_scene()
	var fx = get_node("fx")
	fx.play("vida")
	get_node("explotar").show()

