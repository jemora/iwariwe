
extends Node2D

export var line = "intro"
var talking = false 

func _on_activate():
	show_dialog()

func show_dialog():
	var boxes = get_tree().get_nodes_in_group(("dialogue_box"))
	for box in boxes:
		if not talking:
			box.show_dialog(line)
		else:
			box.end_dialog()