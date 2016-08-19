
extends Panel
var line = "chaman1"
var idioma = 1
var texto
var label
var f
var activo = true


#export (Font) var FONT_latin
#export (Font) var FONT_arabe
#export (Font) var FONT_chino
#export (Font) var FONT_ruso
#export (Theme) var Tema_ruso


func _ready():
	add_to_group("dialogue_box")
	add_to_group("font_idioma")
#	add_to_group("Idioma_GUI")
	set_opacity(0)
	texto = get_node("texto")
	texto.set_size( get_size() - Vector2(10, 10) )
	label = get_node("Label")

	
#	OS.is_in_low_processor_usage_mode()


#	f =File.new()
#	f.open('res://scripts/gdscript.csv',1)


	





	
	set_process(true)
	
#	print (idioma, line)
	
	
func _process(delta):
#	print (idioma, line)





	if activo == true:
#		if idioma == 1:
#			activo = false
	
#			f =File.new()
#			f.open('res://scripts/gdscript.csv',1)
#			f.close()
	
#			texto.add_text(get_node("Label").get_text())
			texto.set_bbcode(get_node("Label").get_text())
#			texto.push_font(FONT_latin) # por aqui no funciona, debe ser en el
#			texto.push_color(Color(0.2, 0.6, 0.8, 1.0))
#			label.set_text(f.get_csv_line()[1])

#		texto.set_theme(Tema_ruso)

#			label.set_text("arabes")

	pass




#----Idiomas, viene de idioma gui------- 
func set_idioma1():
	idioma = 1

func set_idioma2():
	idioma = 2

func set_idioma3():
	idioma = 3

func set_idioma4():
	idioma = 4

func set_idioma5():
	idioma = 5

func set_idioma6():
	idioma = 6

func set_idioma7():
	idioma = 7








func show_dialog( line ):
	#------llama el archivo de texto csv y lo abre----- 
#	f =File.new()
#	f.open('res://scripts/gdscript.csv',1)
#--------------------



#	if idioma == 1:
	if line == "chaman1":
		label.set_text("chaman1")
		set_opacity(1)

	if line == "gracias_fuego":
		label.set_text("gracias_fuego")
		set_opacity(1)

	if line == "huevo":
		label.set_text("mision_huevo")
		set_opacity(1)

	if line == "huevo_listo":
		label.set_text("huevo_listo")
		set_opacity(1)






func end_dialog():
#	f =File.new()
#	f.open('res://scripts/gdscript.csv',1)
#	texto.set_bbcode( "" )
#	f.close()
	set_opacity( 0 )
	label.set_text("")
	pass
	
