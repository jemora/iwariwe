
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var mover = false
var timer
var activo = 0
var tiempo = 1

func _ready():

	timer = get_node("Timer")
	timer.connect("timeout", self, "parar")
#	puente()

	set_process(true)

func _process(delta):

	if activo == 1:
		tiempo = 0
		if mover == true:
			set_mode(MODE_CHARACTER)
			set_linear_velocity(Vector2(100, 0))
			get_node("polea").rotate(-0.2)
			get_node("polea1").rotate(-0.2)
			get_owner().get_node("caminos/ruleta").rotate(0.02)
			get_owner().get_node("caminos/ruleta1").rotate(0.02)
			get_owner().get_node("caminos/ruleta3").rotate(0.02)
			get_owner().get_node("caminos/ruleta_sombra").rotate(0.02)
			get_node("SamplePlayer2D").play("chinche")
			get_owner().get_node("caminos/ruleta/SamplePlayer2D").play("chinche")
			

		if mover == false:
			set_mode(MODE_CHARACTER)
			set_linear_velocity(Vector2(-100, 0))
			get_node("polea").rotate(0.2)
			get_node("polea1").rotate(0.2)
			get_owner().get_node("caminos/ruleta").rotate(-0.02)
			get_owner().get_node("caminos/ruleta1").rotate(-0.02)
			get_owner().get_node("caminos/ruleta3").rotate(-0.02)
			get_owner().get_node("caminos/ruleta_sombra").rotate(-0.02)
			get_node("SamplePlayer2D").play("chinche")
			get_owner().get_node("caminos/ruleta/SamplePlayer2D").play("chinche")


func puente():
		if tiempo == 1:
			activo = 1
			timer.start()	


func parar():
	set_mode(MODE_STATIC)
	timer.stop()
	tiempo = 1
	activo = 0

	if mover == true:
		mover = false

	elif mover == false:
		mover = true

func madera():
	pass