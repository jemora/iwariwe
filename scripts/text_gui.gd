
extends Node2D

export(String, FILE) var splashes_path = "res://splashes.txt"

onready var splashes = FileManager.get_file_lines(splashes_path)

func _ready():
	# Strip empty newlines
	var splashes_new = []
	for line in splashes:
		if line.strip_edges() != "":
			splashes_new.append(line)
	splashes = splashes_new
	get_node("label").set_text(splashes[1])
	

