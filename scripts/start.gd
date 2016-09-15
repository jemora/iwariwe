extends Node2D


func _ready():

	get_node("Button").connect("pressed",self,"_on_button_pressed")
	
	set_process(true)

func _on_button_pressed():  

	# get_node("/root/mod_scener").sload("res://main.scn", "Start/Scener/Progress", 3, "Start/Scener/Background", 4, true)
	# get_node("/root/mod_scener").sload("res://main.scn", "Start/Scener/Progress", 3, "Start/Scener/Background", 4)
	get_node("/root/mod_scener").sload("res://niveles/level_01_a.xml", "Start/Scener/Progress", 3, "Start/Scener/Background", 4)
#	get_node("/root/mod_scener").sload("res://main.scn", "Start/Scener/Progress", 3)
#	get_node("/root/mod_scener").sload("niveles/level_01_a.xml", "Start/Scener/Progress")
	# get_node("/root/mod_scener").sload("res://main.scn")
	# get_node("/root/mod_scener").fastload("res://main.scn")

	get_node("Button").set_disabled(true)
	
func _process(delta):
	get_node("ro").rotate(-0.2)