
extends RigidBody2D


var input_states = preload("res://scripts/input_states.gd")

var btn_action = input_states.new("btn_jump")



func _ready():
	set_fixed_process(true)

func _fixed_process(delta):

	var dialogo = get_tree().get_nodes_in_group("dialogos")
	for dialo in dialogo:
		var dpos = self.get_pos() - dialo.get_pos()
		var dist = sqrt(dpos.x * dpos.x + dpos.y*dpos.y)
		
		if dist<120 and btn_action.check() == 3:
			dialo._on_activate()
			#get_owner().get_node("gui/splash/label").set_text("xxxxxxxxx")
