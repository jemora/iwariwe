
extends RigidBody2D

var timer_d_ataque
var timer_para_dormir
var timer_despierta
var timer_despierta_2
var AI = 1




func _ready():
	
	pass

	despierta()
#	dormida()
#	rebote()







func dormir():
	if AI == 1:
		get_node("AnimationPlayer").play("dormir")
		get_node("SamplePlayer2D").play("listo")
	
		timer_para_dormir = get_node("Timer_para_dormir")
		timer_para_dormir.connect('timeout',self,'dormir')
		timer_para_dormir.stop()
	
		timer_despierta = get_node("Timer_despierta")
		timer_despierta.connect('timeout',self,'despierta')
		timer_despierta.start()
	
	
#		print("dormir")


func despierta():
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
	
	
func rebote():
	AI = 0
	get_node("AnimationPlayer").play("rebote")
	get_node("SamplePlayer2D").play("listo")