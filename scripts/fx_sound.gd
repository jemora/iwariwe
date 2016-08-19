
extends SamplePlayer2D

var sound = "def"
var timer

func _ready():
	add_to_group("fx")
	timer = get_node("Timer")
	timer.connect("timeout", self, "parar")

	set_process(true)

#	_play(sound)

func _play(sound):
	play(sound)
	timer.start()
	
	
func parar():
	stop_all()
	timer.stop()
	
func _process(delta):
#	print(sound)
	pass