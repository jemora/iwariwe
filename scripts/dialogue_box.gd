
extends Panel


var texto
var dialog_dict = {
	chaman1 = "[fill]Hola! soy el [b]Chamán[/b], necesito tu ayuda para atrapar el ave que se robo el [color=yellow]fuego[/color]",
	chaman2 = "[fill]Necesito una pluma azul [img]res://textures/elementos/pluma_azul.png[/img]",
	chaman3 = "[fill]Necesito una pluma amarilla [img]res://textures/elementos/pluma_amarilla.png[/img]",
	chaman4 = "[fill]Necesito una pluma morada [img]res://textures/elementos/pluma_morada.png[/img]",
	chaman5 = "[fill]Necesito una pluma roja [img]res://textures/elementos/pluma_roja.png[/img]",
	chaman6 = "[fill]Necesito una pluma verde [img]res://textures/elementos/pluma_verde.png[/img]",
	gracias_fuego = "Urraa... gracias por conseguir el fuego, ahora podremos comer nuestro alimento cocinado. Te daré una pluma de loro como agradecimiento.",
	pazul = "[fill]Gracias por conseguirme una pluma azul.",
	pamarilla = "[fill]Gracias por conseguirme una pluma amarilla.",
	pmorada = "[fill]Gracias por conseguirme una pluma morada.",
	proja = "[fill]Gracias por conseguirme una pluma roja.",
	pverde = "[fill]Gracias por conseguirme una pluma verde.",
	huevo = "[fill][color=purple]A los caimanes les atrae el sonido de los huevos cuando caen dentro del agua.[/color]",
	huevo_listo = "[fill][color=purple]Lo más seguro es que todos los caimanes se vendrán a este lugar.[/color]",




}


var dialog_dict2 = {
	chaman1 ="[fill]Hi, i'm the [b]Yanomami[/b] chman",
	chaman2 = "[fill]Segundo diálogo ingles",
	chaman3 = "[fill]Tercer diálogo ingles",
	gracias_fuego = "[center]Urraa ingles... gracias por conseguir el fuego, ahora podremos comer nuestro alimento cocinado. Te daré una pluma de loro como agradecimiento.[/center]",
	pazul = "[fill]Gracias por conseguirme una pluma azul ingles.",
	huevo = "[fill][color=purple]Ingles... A los caimanes les atrae el sonido de los huevos cuando caen dentro del agua.[/color]",
	huevo_listo = "[fill][color=purple]Ingles... Lo más seguro es que todos los caimanes se vendrán a este lugar.[/color]",



}


var dialog_dict3 = {
	chaman1 ="Hola! soy el [b]Chamán[/b] yanomami, necesito tu ayuda para atrapar el ave que se robo el [color=yellow]fuego[/color]",
	chaman2 = "[fill]yano Segundo diálogo",
	chaman3 = "[fill]yano Tercer diálogo",
	gracias_fuego = "Urraa yanomami... gracias por conseguir el fuego, ahora podremos comer nuestro alimento cocinado. Te daré una pluma de loro como agradecimiento.",
	pazul = "[fill]Gracias por conseguirme una pluma azul yanomami.",
	huevo = "[fill][color=purple]Yanomami... A los caimanes les atrae el sonido de los huevos cuando caen dentro del agua.[/color]",
	huevo_listo = "[fill][color=purple]Yanomami... Lo más seguro es que todos los caimanes se vendrán a este lugar.[/color]",



}





var line
var idioma = 1


func _ready():
	add_to_group("dialogue_box")
#	add_to_group("Idioma_GUI")
	set_opacity(0)
	texto = get_node("text")
	texto.set_size( get_size() - Vector2(10, 10) )






#----Idiomas, viene de idioma gui------- 
func set_idioma1():
	idioma = 1
#	print (idioma)


func set_idioma2():
	idioma = 2
#	print (idioma)


func set_idioma3():
	idioma = 3
#	print (idioma)
#----------------------------





#	if line == "":
#		end_dialog()
	
#	if idioma == 1:
#		line = "land"
#		show_dialog(line)
#	if idioma == 2:
#		line = "land"
#		show_dialog(line)

func show_dialog( line ):
#	var boxes = get_tree().get_nodes_in_group(("dialogue_box"))

	if idioma == 1:
		texto.set_bbcode( dialog_dict[line] )
		set_opacity(1)

	if idioma == 2:
		texto.set_bbcode( dialog_dict2[line] )
		set_opacity(1)

	if idioma == 3:
		texto.set_bbcode( dialog_dict3[line] )
		set_opacity(1)

#	print(dialog_dict[line])
#	print (idioma)




func end_dialog():
	set_opacity( 0 )
	texto.set_bbcode( "" )
	