# Data autoload
extends Node

#const path = "user://share/data.txt"
const path = "user://data.txt"




var bonos = 0
var medicinas = 0
var plumas = 0
#var idioma = ""
#var idiomas

func _ready():
	load_data()
#	print_data()
#	gold = 100
#	score = 500
#	name = "Dude"
#	save_data()
	get_owner().get_node("gui/Popup_item/Bonos_tolal").set_text(str(bonos))
	get_owner().get_node("gui/Popup_item/Medicina_total").set_text(str(medicinas))
	get_owner().get_node("gui/Popup_item/Plumas_total").set_text(str(plumas))
#	get_node("name").set_text(name)
	add_to_group("save_load")
#	print(idioma)
	
#	set_delta(true)
#	idiomas = get_owner().get_node("gui/idioma_gui").lenguaje_GUI
#	idioma = idiomas

#func _delta(delta):
#	idioma = get_owner().get_node("gui/idioma_gui").get_text()




func add_bonos():
	bonos += 1
	save_data()
	get_owner().get_node("gui/Popup_item/Bonos_tolal").set_text(str(bonos))

func add_medicinas():
	medicinas += 1
	save_data()
	get_owner().get_node("gui/Popup_item/Medicina_total").set_text(str(medicinas))

func add_plumas():
	plumas += 1
	save_data()
	get_owner().get_node("gui/Popup_item/Plumas_total").set_text(str(plumas))




func load_data():
	var f = File.new()
	var err = f.open(path,File.READ)
	if err != OK: # err != 0
		print("(load)Couldn't open the file. Error code: ",err)
		return 1 # end loading function
	
	bonos = f.get_var()
	medicinas = f.get_var()
	plumas = f.get_var()
#	idioma = idioma
#	print("Data loaded.")
	return 0 # succesfully loaded








func save_data():
	var f = File.new()
	var err = f.open(path,File.WRITE)
	
	if err != OK: # err != 0
		print("(save)Couldn't open the file. Error code: ",err)
		return 1 # end saving function
	
	f.store_var(bonos)
	f.store_var(medicinas)
	f.store_var(plumas)
#	f.store_var(idioma)
#	print("Data saved.")
	
	var dialogo = get_tree().get_nodes_in_group("dialogue_box") # actualiza el dialogo del chaman
	for dialo in dialogo: 
		dialo.end_dialog()
	
	return 0
	

func restar_bonos():
	if bonos != 0:
		bonos -= 1
		save_data()
		get_owner().get_node("gui/Popup_item/Bonos_tolal").set_text(str(bonos))

func restar_medicinas():
	if medicinas != 0:
		medicinas -= 1
		save_data()
		get_owner().get_node("gui/Popup_item/Medicina_total").set_text(str(medicinas))

func restar_plumas():
	if plumas != 0:
		plumas -= 1
		save_data()
		get_owner().get_node("gui/Popup_item/Plumas_total").set_text(str(plumas))





