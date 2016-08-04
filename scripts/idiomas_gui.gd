# Data autoload
extends Node

#const path = "user://share/data.txt"
const path = "user://idiomas.txt"




var bonos = 0
var medicinas = 0
var plumas = 0
var idioma = 0
var idiomas
var save = true

func _ready():
	load_data()
#	print_data()
#	gold = 100
#	score = 500
#	name = "Dude"
#	save_data()
#	get_owner().get_node("gui/Popup_item/Bonos_tolal").set_text(str(bonos))
#	get_owner().get_node("gui/Popup_item/Medicina_total").set_text(str(medicinas))
#	get_owner().get_node("gui/Popup_item/Plumas_total").set_text(str(plumas))
#	get_node("name").set_text(name)
	add_to_group("idioma_save")
	
	
	set_process(true)

	idiomas = get_text()
	
#	print(idioma)
	
	

#--------------------------
	
func _process(delta):
	if save == true:
		var timer = get_node("Timer")
		timer.start()
		timer.connect('timeout',self,'save')
		
		save = false


	idiomas = get_text()
	if idiomas == "castellano":
		idioma = 1
	
	if idiomas == "ingles":
		idioma = 2

	if idiomas == "yanomami":
		idioma = 3









#------------------
	if idioma == 1:
		var dialogo = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in dialogo:
			idioma.set_idioma1()

	if idioma == 2:
		var dialogo = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in dialogo:
			idioma.set_idioma2()

	if idioma == 3:
		var dialogo = get_tree().get_nodes_in_group("dialogue_box")
		for idioma in dialogo:
			idioma.set_idioma3()







#-----------------------
func save():
	var timer = get_node("Timer")

	save_idioma()
	timer.stop()





#-------------------------
func load_data():
	
	var f = File.new()
	var err = f.open(path,File.READ)
	if err != OK: # err != 0
		print("(load)Couldn't open the file. Error code: ",err)
		return 1 # end loading function
	
#	bonos = f.get_var()
#	medicinas = f.get_var()
#	plumas = f.get_var()
	idioma = f.get_var()
#	print("Data loaded.")
	return 0 # succesfully loaded
	print(idioma)


#---------------------------
func save_idioma():

	var f = File.new()
	var err = f.open(path,File.WRITE)
	
	if err != OK: # err != 0
		print("(save)Couldn't open the file. Error code: ",err)
		return 1 # end saving function
	
#	f.store_var(bonos)
#	f.store_var(medicinas)
#	f.store_var(plumas)
	f.store_var(idioma)

	
	print(idioma)

	
	return 0
	



