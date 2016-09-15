
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var activo = 1
export var boton = 1


func _ready():


	get_node("Area2D").connect("body_enter",self,"activar")
	get_node("Area2D").connect("body_exit",self,"desactivar")


func activar( body ):
	
	if boton == 1:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("balanza_auto").arriba()

	if boton == 2:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("balanza_auto2").arriba()

	if boton == 3:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("balanza_auto3").arriba()

	if boton == 4:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("balanza_auto4").arriba()


	if boton == 5:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("balanza_auto4").izquierda()

	if boton == 6:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("balanza_auto4").derecha()


	if boton == 7:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("balanza_auto5").arriba()


	if boton == 8:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("balanza_auto5").izquierda()

	if boton == 9:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("balanza_auto5").derecha()


	if boton == 10:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("balanza_auto6").arriba()


	if boton == 11:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("balanza_auto6").izquierda()


	if boton == 12:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("balanza_auto6").derecha()


	if boton == 13:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("balanza_auto7").arriba()


	if boton == 14:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("balanza_auto7").izquierda()

	if boton == 15:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("balanza_auto7").derecha()

	if boton == 16:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("caminos/puente").puente()

	if boton == 17:
		if activo == 1:
			activo = 0
			get_node("AnimationPlayer_boton").play("bonton")
			get_node("SamplePlayer2D_boton").play("papel3")
			get_owner().get_node("").piedra_1 = 1



func desactivar( body ):
	activo = 1
	get_node("AnimationPlayer_boton").play("bonton")
	get_node("SamplePlayer2D_boton").play("papel3")




