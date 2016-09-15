
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

export var TS = 0.0
export var TC = 0.0

var timer
var timer_salto

func _ready():
	add_to_group("caribe")
	timer = get_node("Timer")
	timer.connect('timeout',self,'saltar')
	timer.start()
	timer.set_wait_time(TS)

	timer_salto = get_node("son_salto")
	timer_salto.connect('timeout',self,'caida')
	timer_salto.set_wait_time(TC)



	
func saltar():
	get_node("AnimationPlayer").play("salto")
	get_node("SamplePlayer2D").play("salto_pez")
	timer_salto.start()
	get_node("splash_salto").show()
	get_node("splash_caida").show()
	get_node("AnimationPlayer1").play("splash")
	get_node("caribe").show()
	get_node("caribe/CollisionPolygon2D").set_trigger(false)


func caida():
#	get_node("AnimationPlayer").play("salto")
	get_node("SamplePlayer2D").play("caida_pez")
	timer_salto.stop()
	get_node("caribe").hide()
	get_node("caribe/CollisionPolygon2D").set_trigger(true)
	


func caribe():
	pass





