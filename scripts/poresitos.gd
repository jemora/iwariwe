
extends RigidBody2D

var vigilar_on = 0
var vigilar
var timer = null
var timer2 = null
export var abierto = 5
export var cerrado = 1

func _ready():
	add_to_group("poresitos")
	vigilar = get_node("Animation_pore")

	timer = get_node("Timer").connect("timeout", self , "vigilar_A")
	timer = get_node("Timer")
	timer.set_wait_time(abierto)


	timer2 = get_node("Timer 2").connect("timeout", self , "vigilar_B")
	timer2 = get_node("Timer 2")
	timer2.set_wait_time(cerrado)

	timer2.start()
	set_fixed_process(true)

#	alertar()

func _fixed_process(delta):

	#var vigilar_on = get_owner().get_node("elementos/poresito").vigilar_on
	
	var player = get_tree().get_nodes_in_group("player")
	for play in player:
		var dpos = self.get_pos() - play.get_pos()
		var dist = sqrt(dpos.x * dpos.x + dpos.y*dpos.y)
		if dist<500 and vigilar_on == 1:
			alertar()
			

			var gritos = get_owner().get_node("player/SamplePlayer2D_reinicio")
			gritos.play("salto")
			var world = get_tree().get_nodes_in_group("world")
			for play in world:
				play.time_start()






	
func vigilar_A():
	timer2.start()
	vigilar.play("capa_cerrar") #capa_cerrar
	timer.stop()
	vigilar_on = 0
#	print(vigilar_on)
		


func vigilar_B():
	timer.start()
	vigilar.play("capa")
	timer2.stop()
	vigilar_on = 1
#	print(vigilar_on)

func alertar():
	vigilar.play("alertar")
	vigilar_on = 2
	get_owner().get_node("gui/splash/label").set_text("Ho ho me han visto")
	
	var mensajes_GUI = get_tree().get_nodes_in_group("mensajes_GUI")
	for reinicio in mensajes_GUI:
		reinicio.set_opacidad()

	
	