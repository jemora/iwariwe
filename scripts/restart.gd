
extends Sprite

# member variables here, example:
# var a=2
# var b="textvar"
var restart_line





func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	restart_line = get_node("CollisionShape2D")

	
	
func _process(delta):
	if restart_line in player.get_colliding_bodies():
		get_tree().reload_current_scene()
	
	
	
	pass


