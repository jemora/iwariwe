
extends Label

#export(String, FILE) var splashes_path = "res://igu/splashes.txt"

#onready var splashes = FileManager.get_file_lines(splashes_path)


var idioma = 1
var opacidad = 0.9
var on = 1


func _ready():
	add_to_group("Idioma_GUI")
	add_to_group("mensajes_GUI")
	add_to_group("font_idioma")
	
	
#	print(idioma)
	
	
#	var splashes_new = []
#	for line in splashes:
#		if line.strip_edges() != "":
#			splashes_new.append(line)
#	splashes = splashes_new

#	set_text("Haaa...")





#------PROCESO ACTIVO AUTONOMO---
#	set_process(true)
	
	
#func _process(delta):
#---------LLAMA EL TEXTO DEL LABEL IDIOMA GUI------------
#	var set_idiomas = get_owner().get_node("gui/idioma_gui").set_text()
#	set_text(str(set_idiomas))
#--------------------------------
#	set_text(splashes[1])




#--------MENSAJES --------
#REINICIO-grito
func reiniciar_grito():
	set_text("Mañoco...") # set_text(splashes[1])

func pluma_coleccion():
	set_text("Una pluma para mi coleccion")
	set_opacidad()





#---fundido del mensaje..... ocultar viene de player cuando acciona
func ocultar():
	var text = get_text()
	if text != "" and on == 1 and opacidad > 0.2:
		opacidad -= 0.01  
		set_opacity(opacidad)
  
	if opacidad < 0.2:  
		set_text("")
		on = 0

	if on == 0:
		opacidad = 1
		on = 1
		set_opacity(opacidad)

#	print(text, opacidad)
		
	#get_tree().reload_current_scene()

func set_opacidad():
	opacidad = 1
	set_opacity(opacidad)

func set_opacidad_off():
	set_text("")
#-----------IDIOMAS INTERFACE-----------viene de:  idioma_gui
func set_idioma1():
	idioma = 1
#	print("idioma 1 label")
#	get_owner().get_node("gui/hud_text/Bonos").set_text(splashes[1])
#	get_owner().get_node("gui/hud_text/Medicinas").set_text(splashes[2])




#---------LLAMA EL TEXTO DEL LABEL IDIOMA GUI------------
#	var set_idiomas = get_owner().get_node("gui/idioma_gui").set_text
#	set_text(str(set_idiomas))


func set_idioma2():
	idioma = 2
#	print("idioma 2 label")
#	get_owner().get_node("gui/hud_text/Bonos").set_text(splashes[3])
#	get_owner().get_node("gui/hud_text/Medicinas").set_text(splashes[4])



func set_idioma3():
	idioma = 3
#	print("idioma 3 label")
#	get_owner().get_node("gui/hud_text/Bonos").set_text(splashes[5])
#	get_owner().get_node("gui/hud_text/Medicinas").set_text(splashes[6])








		#	get_tree().quit()