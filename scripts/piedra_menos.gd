
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	add_to_group("piedra")
	
	pass

func piedra_menos():
	pass

func piedra():
	pass


func _on_piedra_menos_body_enter( body ):
	
	if (body.has_method("madera")):
		get_node("SamplePlayer2D").play("piedra_madera")

	if (body.has_method("piedra")):
		get_node("piedra").play("golpe_roca")

	if (body.has_method("agua")):
		get_node("SamplePlayer2D").play("pancada_agua")



func _on_piedra_circulo_body_enter( body ):
	if (body.has_method("madera")):
		get_node("SamplePlayer2D").play("piedra_madera")

	if (body.has_method("piedra")):
		get_node("piedra").play("golpe_roca")

	if (body.has_method("agua")):
		get_node("SamplePlayer2D").play("pancada_agua")





func _on_piedra_mas_body_enter( body ):
	if (body.has_method("madera")):
		get_node("piedra").play("piedra_madera")

	if (body.has_method("piedra")):
		get_node("SamplePlayer2D").play("golpe_roca")

	if (body.has_method("agua")):
		get_node("SamplePlayer2D").play("pancada_agua")





func _on_piedra_lisa_body_enter( body ):
	if (body.has_method("madera")):
		get_node("piedra").play("piedra_madera")

	if (body.has_method("piedra")):
		get_node("SamplePlayer2D").play("golpe_roca")

	if (body.has_method("agua")):
		get_node("SamplePlayer2D").play("pancada_agua")




