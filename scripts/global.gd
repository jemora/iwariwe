extends Node

var viewport_scale
var viewport_res

#----------
var current_scene = null


var controles = 1

func _ready():
	if controles == 1:
		var viewport = get_node("/root").get_children()[1].get_viewport_rect().size
		viewport_res = get_node("/root").get_children()[1].get_viewport_rect().size
		viewport_scale = 600/viewport.y
	
#---------------------
	var root = get_tree().get_root()
	current_scene = root.get_child( root.get_child_count() -1 )



func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function from the running scene.
	# Deleting the current scene at this point might be
	# a bad idea, because it may be inside of a callback or function of it.
	# The worst case will be a crash or unexpected behavior.
	
	# The way around this is deferring the load to a later time, when
	# it is ensured that no code from the current scene is running:
	
	call_deferred("_deferred_goto_scene",path)


func _deferred_goto_scene(path):
    # Immediately free the current scene
    current_scene.free()

    # Load new scene
    var s = ResourceLoader.load(path)
    current_scene = s.instance()
    get_tree().get_root().add_child(current_scene)
    get_tree().set_current_scene( current_scene )
