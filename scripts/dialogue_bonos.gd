
extends Node2D

var line = "land"
var talking = false 

func _ready():
#	add_to_group("npcs")
	show_dialog()
#	print("Stuff is happening")



func show_dialog():
	var boxes = get_tree().get_nodes_in_group(("dialogue_box"))
	for box in boxes:
#		print("Here's a box")
		if not talking:
			box.show_dialog(line)
#			talking = true
#			for player in get_tree().get_nodes_in_group("player"):
#				player.stop_walking()
		else:
			box.end_dialog()
#			emit_signal("start_moving")
#			talking = false
#			for player in get_tree().get_nodes_in_group("player"):
#				player.start_walking()

