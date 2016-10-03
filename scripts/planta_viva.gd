
extends RigidBody2D

var timer_d_ataque
var timer_para_dormir
var timer_despierta
export var timer_despierta_wait = 0.0
var timer_despierta_2
var rebote
export var ghost = 0
export var AI = 1
export var rebotando = 0
export var despierta = 0.0
export var rebote_planta = 1.000
export var limite_rebote = 1.000
export var rebote_incremento = 100

func _ready():
	add_to_group("planta")
	pass

#	despierta()
#	dormida()
#	rebote()

	set_process(true)

	despierta = get_node("Timer_despertar")
	despierta.connect('timeout',self,'despierta')
	despierta.start()





func _process(delta):
	if ghost == 1:
		get_node("cabeza/Cabeza_coll/CollisionPolygon2D").set_trigger(true)

	if rebotando == 1:
		rebotando = 0
#		print("rebotando")
		get_node("SamplePlayer2D_rebote").play("rebote")
		get_node("AnimationPlayer").play("rebote")
		rebote = get_node("Timer_rebote")
		rebote.connect('timeout',self,'despierta')
		rebote.start()
		if rebote_planta != limite_rebote:
			rebote_planta += rebote_incremento







func dormir():
	if AI == 1:
		get_node("AnimationPlayer").play("dormir")
		get_node("SamplePlayer2D").play("listo")
	
		timer_para_dormir = get_node("Timer_para_dormir")
		timer_para_dormir.connect('timeout',self,'dormir')
		timer_para_dormir.stop()
	
		timer_despierta = get_node("Timer_despierta")
		timer_despierta.connect('timeout',self,'despierta')
		timer_despierta.set_wait_time(timer_despierta_wait)
		timer_despierta.start()
	
	
#		print("dormir")


func despierta():
	rebotando = 0
	despierta = get_node("Timer_despertar")
	despierta.stop()



	if AI == 1:
		get_node("AnimationPlayer").play("despierta")
		get_node("SamplePlayer2D").play("listo")
		
		timer_d_ataque = get_node("Timer_ataque")
		timer_d_ataque.connect('timeout',self,'atacar')	
		timer_d_ataque.start()
	
		timer_despierta = get_node("Timer_despierta")
		timer_despierta.connect('timeout',self,'despierta')
		timer_despierta.stop()
		
		timer_despierta_2 = get_node("Timer_despierta_2")
		timer_despierta_2.connect('timeout',self,'despierta_2')
		timer_despierta_2.stop()
		
		rebote = get_node("Timer_rebote")
		rebote.connect('timeout',self,'despierta')
		rebote.stop()
		
#		print("despierta")


func despierta_2():
	if AI == 1:
		get_node("AnimationPlayer").play("despierta")
		get_node("SamplePlayer2D").play("listo")
		
		timer_para_dormir = get_node("Timer_para_dormir")
		timer_para_dormir.connect('timeout',self,'dormir')
		timer_para_dormir.start()
	
		timer_despierta_2 = get_node("Timer_despierta_2")
		timer_despierta_2.connect('timeout',self,'despierta_2')
		timer_despierta_2.stop()
		
#		print("despierta2")


func atacar():
	if AI == 1:
		get_node("AnimationPlayer").play("ataque")
		get_node("SamplePlayer2D").play("listo")
	
	
		timer_d_ataque = get_node("Timer_ataque")
		timer_d_ataque.connect('timeout',self,'atacar')
		timer_d_ataque.stop()
	
	#	timer_despierta = get_node("Timer_despierta")
	#	timer_despierta.connect('timeout',self,'despierta')
	#	timer_despierta.stop()
	
		timer_despierta_2 = get_node("Timer_despierta_2")
		timer_despierta_2.connect('timeout',self,'despierta_2')
		timer_despierta_2.start()
		
#		print("atacar")

func dormida():
	AI = 0
	get_node("AnimationPlayer").play("dormir")
	get_node("SamplePlayer2D").play("listo")

	



func planta(): # detectado en player if has...
	pass







