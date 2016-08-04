
extends RigidBody2D

var arana = false
var volando
var velocidad = 1
var activo = true
var Ray
var Ray_frente_abajo
var Ray_suelo
var Ray_trasero
var Ray_arriba

var timer = null 
export var tiempo = 10
#var tela_arana
var dialogo

var import_chispa = preload("res://../elementos/fuego_ave.scn")


func _ready():

	
	
#	tela_arana = get_owner().get_node("telarana")
	add_to_group("ave")
	volando = get_node("AnimationPlayer")
	set_process(true)
	
	Ray = get_node("RayCast2D")

	
	Ray_suelo = get_node("RayCast_suelo")
	Ray_trasero = get_node("RayCast_trasero")
	Ray_frente_abajo = get_node("RayCast2D1")
	Ray_arriba = get_node("RayCast_arriba")

	timer = get_node("Timer_chispa")
	timer.start()
	timer.set_wait_time(tiempo)
	timer.connect('timeout',self,'add_chispa')




func _process(delta):
	timer = get_node("Timer_chispa")
	timer.set_wait_time(tiempo)



	var player = get_tree().get_nodes_in_group("player")
	for play in player:
		var dpos = self.get_pos() - play.get_pos()
		var dist = sqrt(dpos.x * dpos.x + dpos.y*dpos.y)
		if dist<300 and activo == true and arana == false: # and btn_action.check() == 1:
			volando.play("volando")
			volando.set_speed(3)
			tiempo = 2
			timer.start()
			
			set_linear_velocity(Vector2(750,-0))
			set_mode(MODE_CHARACTER)
			activo = false



		if dist>400 and activo == false and arana == false:
			velocidad = 2
			volando.play("volando")
			volando.set_speed(1)
			activo = true
			tiempo = 10
#			timer.start()



		if dist<350 and arana == false: # and btn_action.check() == 1:
			set_linear_velocity(Vector2(300,-0))
			set_mode(MODE_CHARACTER)
			tiempo = 1


			

		if dist>400 and not Ray_suelo.is_colliding() and arana == false: # and btn_action.check() == 1:
			set_linear_velocity(Vector2(250,200))
			set_mode(MODE_CHARACTER)

		if dist>400 and Ray_suelo.is_colliding() and arana == false:
			set_mode(MODE_STATIC)



		if dist<200 and Ray_suelo.is_colliding() and arana == false: # and btn_action.check() == 1:
			set_linear_velocity(Vector2(400,-400))
#			set_mode(MODE_STATIC)


	if Ray.is_colliding():
		set_linear_velocity(Vector2(300,-350))


	if Ray_frente_abajo.is_colliding():
		set_linear_velocity(Vector2(300,-350))


	if Ray_trasero.is_colliding():
		set_linear_velocity(Vector2(900,-150))
#		set_mode(MODE_STATIC)

	if Ray_arriba.is_colliding():
		set_linear_velocity(Vector2(200,1200))




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
	arana = true
	set_mode(MODE_STATIC)
	volando.play("volando")
	volando.set_speed(4)

func morir():
	queue_free()
	var plumas = get_tree().get_nodes_in_group("world")
	for pluma in plumas:
		pluma.pluma()
