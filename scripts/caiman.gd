
extends StaticBody2D


var velocidad = 1
var activo = true
var atacar = true
var timer = null 
var ataque
var Ray_arriba
var Ray_frente
var Ray_frente_ojos
#var Ray_cenital
var player
var sensor_adente
var ataque_arriba = false

var sensor_arriba

var import_chispa = preload("res://../elementos/fuego_ave.scn")
var sonido

func _ready():

	add_to_group("caiman")
	ataque = get_node("AnimationPlayer_caiman")
	set_process(true)

#	timer = get_node("Timer_chispa")
	Ray_arriba = get_node("Ray_arriba")
	Ray_frente = get_node("Area2D/Ray_frente")
	Ray_frente_ojos = get_node("Area2D/Ray_frente_ojos")
#	Ray_cenital = get_node("RayCast2D_cenital")
	player = get_owner().get_node("player")
	sensor_adente = get_node("Area2D/sensor_adelante")
	sonido = get_owner().get_node("player/SamplePlayer2D")
	sensor_arriba = get_node("Area2D/sensor_arriba")


func _process(delta):
#	timer.set_wait_time(tiempo)



	var player = get_tree().get_nodes_in_group("player")
	for play in player:
		var dpos = self.get_pos() - play.get_pos()
		var dist = sqrt(dpos.x * dpos.x + dpos.y*dpos.y)
		if dist>500:
#			activo = true
#			atacar = false
#			print(activo)
			pass




	if Ray_frente.is_colliding() and activo == true:
		ataque.play("abrir_ojo")
		activo = false

	if Ray_arriba.is_colliding() and activo == true:
		ataque.play("abrir_ojo")
		activo = false


	if Ray_frente_ojos.is_colliding():
		ataque.play("cerrar_ojo")
		activo = true









func atacar():
	ataque.play("atacar_adelante")

	
func atacar_arriba():
	ataque.play("atacar_arriba")

	pass



func girar():
	set_scale(Vector2(-1,1))
#	set_scale(Vector2(1,-1))
	sensor_arriba.queue_free()











func add_chispa():
	var chispa = import_chispa.instance()

	#  Dos formas de asignar la posicion----------
	
#	var pos = get_pos() + get_node("Position2D").get_pos()*Vector2(1.0, 1.0)
#	chispa.set_pos(pos)
#	get_parent().add_child(chispa)

	chispa.set_pos(get_node("Position2D").get_global_pos())
	get_node("../..").add_child(chispa)


func restar():
	var morir = get_node("Timer_morir")
	morir.start()
	morir.connect('timeout',self,'morir')


func morir():get_tree().reload_current_scene()






