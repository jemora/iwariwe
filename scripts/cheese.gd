
extends KinematicBody2D

var taken = true
var import_chispa = preload("res://../elementos/fuego_ave.scn")
#var combo = preload("res://combo.scn")
var timer
#var cheeseTakenCount = 0 # 
var inst = false

func _ready():
	set_process(true)
	add_to_group("fuego")
	timer = get_node("Timer")
	timer.start()
	timer.connect("timeout", self, "eliminar")
#func _process(delta):
#	var cheeseCount = get_parent().get_parent().get_node("mouse").cheeseCount
#	if taken == true:
#		get_node("Area2D/cheeseSprite").hide()
#		if has_node("CollisionShape2D"):
#			get_node("CollisionShape2D").queue_free()
			
			
#		if cheeseCount > 1:
#			var comboInst = combo.instance()
#			comboInst.get_node("comboCount").set_text("x"+str(cheeseCount))
#			add_child(comboInst)
			#print(cheeseCount)
#			taken = false
#func set_process(delta):
#	var chispa = import_chispa.instance()
#	remove_child(chispa)
	
func chispas():

	var chispa = import_chispa.instance()

	get_parent().add_child(chispa)
	


	#get_node("cheese"+str(cheeseTakenCount)).set_pos(get_pos())
#		inst = true
#		
func eliminar():
	var chispa = import_chispa.instance()
	set_owner(chispa)
	


