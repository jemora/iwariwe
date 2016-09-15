# Data autoload
extends Node

#const path = "user://share/data.txt"
const path = "user://idiomas.txt"

var bonos = 0
var medicinas = 0
var plumas = 0
var idioma = 0
var nivel = 1
var idiomas
var save = true


onready var _label = Label.new()





func _ready():
	load_data()
#	save_idioma()

	add_to_group("nivel_save")
	
	set_process(true)

	set_text(str(nivel))


#--------------------------
	
func _process(delta):
#	print(nivel)
	pass





#-----------------------
func save():
	save_idioma()








#-------------------------
func load_data():
	
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
#	print(nivel)


#---------------------------
func save_idioma():

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


	
#	print(nivel)

	
	return 0
	



