
extends Node2D

const path = "user://idiomas.txt"

onready var _label = Label.new()


var nivel = 1
var bonos = 0
var medicinas = 0
var plumas = 0
var idioma = 0

var timer
var timer2
var set_nivel = 1
var mundo = 1
var boton = 1

var input_states = preload("res://scripts/input_states.gd")
var btn_action = input_states.new("accion")
var items = input_states.new("items")
var tabulador = input_states.new("tabulador")



func _ready():
#	save_nivel()
	load_data()

	timer = get_node("Timer")
	timer.connect('timeout',self,'cargar')
	timer2 = get_node("Timer2")
	timer2.connect('timeout',self,'volver')

	
#		get_node("Mundo_1/nivel_uno_yanomami_off").connect("pressed" ,self, "mundo_bloqueado")
#		get_node("Mundo_1/nivel_dos_yanomami_off").connect("pressed",self, "mundo_bloqueado")
#		get_node("Mundo_1/nivel_tres_yanomami_off").connect("pressed", self, "mundo_bloqueado")

#		get_node("nivel_uno_rojo").connect("pressed" ,self, "chinche")
#		get_node("nivel_dos_rojo").connect("pressed" ,self, "chinche")
#		get_node("nivel_tres_rojo").connect("pressed" ,self, "chinche")

	
	

	set_process(true)


func _process(delta):
#	print(nivel)
#	print(boton)
#	pass
	var carga = get_node("PopupPanel/cargar")
	carga.rotate(3.0)




# CLAVES PARA DESBLOQUER NIVELS
	
	if  btn_action.check() == 1 and items.check() == 1:
		nivel = 1
		save_nivel()
		print(nivel)


	if  input_states.new("f2").check() == 1 and tabulador.check() == 1:
		nivel = 3
		save_nivel()
		print(nivel)






#---------------------- input_states.new("tabulador")

#	get_node("Sprite2").rotate(3)
	
	

	if nivel >= 1 and nivel < 4:
		mundo = 1
		
	if nivel >= 4 and nivel < 7:
		mundo = 2
		
	if nivel >= 7 and nivel < 10:
		mundo = 3




	if mundo == 1:
		get_node("nivel_uno_rojo").hide()
		get_node("nivel_uno_verde").show()
		
		get_node("nivel_dos_rojo").show()
		get_node("nivel_dos_verde").hide()

		get_node("nivel_tres_rojo").show()
		get_node("nivel_tres_verde").hide()


	if mundo == 2:
		get_node("nivel_uno_rojo").hide()
		get_node("nivel_uno_verde").show()

		get_node("nivel_dos_rojo").hide()
		get_node("nivel_dos_verde").show()

		get_node("nivel_tres_rojo").show()
		get_node("nivel_tres_verde").hide()


	if mundo == 3:
		get_node("nivel_uno_rojo").hide()
		get_node("nivel_uno_verde").show()

		get_node("nivel_dos_rojo").hide()
		get_node("nivel_dos_verde").show()

		get_node("nivel_tres_rojo").hide()
		get_node("nivel_tres_verde").show()



#-------------NIVELES - MUNDO 1 -----------
	if nivel == 1:
		get_node("PopupPanel/Mundo_1/nivel_uno_yanomami").show()
		get_node("PopupPanel/Mundo_1/nivel_uno_yanomami_off").hide()

		get_node("PopupPanel/Mundo_1/nivel_dos_yanomami").hide()
		get_node("PopupPanel/Mundo_1/nivel_dos_yanomami_off").show()

		get_node("PopupPanel/Mundo_1/nivel_tres_yanomami").hide()
		get_node("PopupPanel/Mundo_1/nivel_tres_yanomami_off").show()


	if nivel == 2:
		get_node("PopupPanel/Mundo_1/nivel_uno_yanomami").show()
		get_node("PopupPanel/Mundo_1/nivel_uno_yanomami_off").hide()

		get_node("PopupPanel/Mundo_1/nivel_dos_yanomami").show()
		get_node("PopupPanel/Mundo_1/nivel_dos_yanomami_off").hide()

		get_node("PopupPanel/Mundo_1/nivel_tres_yanomami").hide()
		get_node("PopupPanel/Mundo_1/nivel_tres_yanomami_off").show()



	if nivel == 3:
		get_node("PopupPanel/Mundo_1/nivel_uno_yanomami").show()
		get_node("PopupPanel/Mundo_1/nivel_uno_yanomami_off").hide()

		get_node("PopupPanel/Mundo_1/nivel_dos_yanomami").show()
		get_node("PopupPanel/Mundo_1/nivel_dos_yanomami_off").hide()

		get_node("PopupPanel/Mundo_1/nivel_tres_yanomami").show()
		get_node("PopupPanel/Mundo_1/nivel_tres_yanomami_off").hide()











#------- BOTONES SONIDOS -----------
	var boton_uno_verde = get_node("nivel_uno_verde")
	var boton_dos_verde = get_node("nivel_dos_verde")
	var boton_tres_verde = get_node("nivel_tres_verde")


	var boton_uno_rojo = get_node("nivel_uno_rojo")
	var boton_dos_rojo = get_node("nivel_dos_rojo")
	var boton_tres_rojo = get_node("nivel_tres_rojo")


	var nivel_uno_yanomami = get_node("PopupPanel/Mundo_1/nivel_uno_yanomami")
	var nivel_dos_yanomami = get_node("PopupPanel/Mundo_1/nivel_dos_yanomami")
	var nivel_tres_yanomami = get_node("PopupPanel/Mundo_1/nivel_tres_yanomami")


	var nivel_uno_yanomami_off = get_node("PopupPanel/Mundo_1/nivel_uno_yanomami_off")
	var nivel_dos_yanomami_off = get_node("PopupPanel/Mundo_1/nivel_dos_yanomami_off")
	var nivel_tres_yanomami_off = get_node("PopupPanel/Mundo_1/nivel_tres_yanomami_off")


	if boton == 1 and (boton_uno_verde.is_pressed() or boton_dos_verde.is_pressed() or boton_tres_verde.is_pressed()):
		boton = 0
		get_node("PopupPanel/AnimationPlayer").play("fundido_on")
		get_node("PopupPanel/AnimationPlayer_move").play("bajar")
		get_node("PopupPanel/SamplePlayer2D").play("slider_papel")
		get_node("PopupPanel/SamplePlayer2D_chinche").play("chinche")
		
		get_node("PopupPanel").set_exclusive(true)
		get_node("PopupPanel").popup()
#		get_tree().set_pause(true)
		get_node("PopupPanel").show()


	if boton == 1 and (boton_uno_rojo.is_pressed() or boton_dos_rojo.is_pressed() or boton_tres_rojo.is_pressed()):
		boton = 0
		get_node("PopupPanel/SamplePlayer2D_chinche").play("chinche")



#----- NIVELES ABIERTOS ------------
	if boton == 1 and nivel_uno_yanomami.is_pressed():
		boton = 0
		get_node("PopupPanel/Label").show()
		get_node("PopupPanel/cargar").show()
		set_nivel = 1
		timer.start()
		get_node("PopupPanel/SamplePlayer2D").play("papel2")


	if boton == 1 and nivel_dos_yanomami.is_pressed():
		boton = 0
		get_node("PopupPanel/Label").show()
		get_node("PopupPanel/cargar").show()
		set_nivel = 2
		timer.start()
		get_node("PopupPanel/SamplePlayer2D").play("papel2")

	if boton == 1 and nivel_tres_yanomami.is_pressed():
		boton = 0
		get_node("PopupPanel/Label").show()
		get_node("PopupPanel/cargar").show()
		set_nivel = 3
		timer.start()
		get_node("PopupPanel/SamplePlayer2D").play("papel2")


#----- NIVELES CERRADOS ------------
	if boton == 1 and (nivel_uno_yanomami_off.is_pressed() or nivel_dos_yanomami_off.is_pressed() or nivel_tres_yanomami_off.is_pressed()):
		boton = 0
		get_node("PopupPanel/SamplePlayer2D").play("papel3")



# Reestablece boton a 1 -----------------
	if boton == 0 and not (nivel_uno_yanomami_off.is_pressed() or nivel_dos_yanomami_off.is_pressed() or nivel_tres_yanomami_off.is_pressed() or nivel_uno_yanomami.is_pressed() or nivel_dos_yanomami.is_pressed() or nivel_tres_yanomami.is_pressed() or boton_uno_verde.is_pressed() or boton_dos_verde.is_pressed() or boton_tres_verde.is_pressed() or boton_uno_rojo.is_pressed() or boton_dos_rojo.is_pressed() or boton_tres_rojo.is_pressed()):
		boton = 1








#-------------------------
func load_data():
#	save_nivel()
	print(nivel)
	
	var f = File.new()
	var err = f.open(path,File.READ)
	if err != OK: # err != 0
		print("(load)Couldn't open the file. Error code: ",err)
		return 1 # end loading function
	
	bonos = f.get_var()
	medicinas = f.get_var()
	plumas = f.get_var()
	idioma = f.get_var()
	nivel = f.get_var()
#	print("Data loaded.")
	return 0 # succesfully loaded
	


#---------------------------
func save_nivel():

	var f = File.new()
	var err = f.open(path,File.WRITE)
	
	if err != OK: # err != 0
		print("(save)Couldn't open the file. Error code: ",err)
		return 1 # end saving function
	
	f.store_var(bonos)
	f.store_var(medicinas)
	f.store_var(plumas)
	f.store_var(idioma)
	f.store_var(nivel)


	
	return 0


#--------------- ESCENAS ----------------------------
func cargar():
	if set_nivel == 1:
#		get_node("/root/global").goto_scene("res://niveles/level_01_a.xml")
#		get_node("/root/mod_scener").sload("res://niveles/level_01_a.xml", "Start/Scener/Progress", 3, "Start/Scener/Background", 4)
		get_tree().change_scene("res://niveles/level_01_a.xml")

		
	if set_nivel == 2:
		get_tree().change_scene("res://niveles/level_02.scn")
#		get_node("/root/global").goto_scene("res://niveles/level_01_a.xml")
	if set_nivel == 3:
		get_tree().change_scene("res://niveles/level_03.scn")
#		get_node("/root/global").goto_scene("res://niveles/level_01_a.xml")







func _on_volver_pressed():
	get_node("PopupPanel/AnimationPlayer").play("fundido_off")
	get_node("PopupPanel/AnimationPlayer_move").play("subir")
	get_node("PopupPanel/SamplePlayer2D").play("slider_papel_rapido")
	get_tree().set_pause(false)
	timer2.start()

func volver():
	get_node("PopupPanel").hide()
	timer2.stop()







func _on_menu_idioma_pressed():
	get_tree().change_scene("res://menu/idioma/idiomas.scn")


func _on_salir_pressed():
	get_tree().quit()
