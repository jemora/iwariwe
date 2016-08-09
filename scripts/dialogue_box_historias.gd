
extends Panel

var historia = 1
var line = "nada"
var idioma = 1
var input_states = preload("res://scripts/input_states.gd")
var btn_action = input_states.new("accion")
var adelante = input_states.new("btn_right")
var atras = input_states.new("btn_left")
var opacidad = 0
var fade = 40
var fade_frame = 0



var texto
var dialog_dict = {
	
	nada = "",
	historia1 = "[fill]Mi pueblo Yanomami ha estado comiendo su alimento crudo porque no tienen fuego, uno de los caciques tenía fuego oculto y se iba a la selva para cocinar alimento solo para el y su mujer. Hace unos días se descubrió que guardaba el fuego en su estómago y la única manera de sacárselo fué haciéndolo reír. Sin embargo su mujer es malvada, ha enviado una ave para que se lleve el fuego lejos y ha lanzado una maldición al pueblo, que con ese mismo fuego los cremaran cuando mueran y beberán sus huesos.[/fill][center] NECESITAMOS TU AYUDA PARA ATRAPAR EL AVE QUE SE LLEVÓ EL FUEGO Y ENCENDER UN ÁRBOL ALTO PARA QUE ESPARSA BRASAS A TODAS LAS PERSONAS DEL PUEBLO.",
	historia2 = "[fill] [b][color=red]Iwariwë[/color][/b]nace de la participación de un grupo de pobladores de la comunidad yanomami de Poripori, en el Alto Orinoco de Venezuela, en un taller en el que vivieron la experiencia colectiva de realizar un libro de manera artesanal, que incluyó la fabricación de papel, hilos y tintas, con materiales naturales de su entorno, y el aprendizaje de técnicas de encuadernación.El libro contiene textos manuscritos en idioma yanomami y dibujos cargados de simbolismo, realizados por ellos mismos, que nos ofrecen una particular versión de uno de los mitos fundamentales de su cultura: Iwariwë, el origen del fuego entre los hombres. Monte Ávila Editores Latinoamericana/ Instituto de Estudios Avanzados, 2011 4.000 ejemplares. 22 págs.Fotografía: Ascenso al Acopán fotos de Arianna AQ.[/fill]",
	historia3 = "[fill]De cualquier modo, el relato que reproducimos en esta edición, fruto de la trascripción hecha de la voz del chamán Makowë, tiene una riqueza que no se agota en significaciones precisas. Su belleza sintética, sus curiosas imágenes y a veces sus escatológicos símbolos hablan de una cosmología rica y completa, apenas conocida por el pueblo venezolano. Este relato de Iwariwë se desarrolla en un ambiente donde los hombres son animales, y viceversas, subrayando la tremenda confusión que existe en la cultura yanomami entre dioses, hombres y naturaleza.[/fill]",
	historia4 = "[fill]Fruto de un intercambio que casi lleva dos décadas entre miembros de la comunidad Mahekoto (Platanal, Alto Orinoco) y artistas como la mexicana Laura Anderson Barbata e investigadores del patrimonio y la conservación como el venezolano Álvaro González, es que ha sido posible la producción de este libro tan especial. Desde 1992 se estableció un nexo intercultural que ha llevado a algunos miembros de la comunidad yanomami a dominar la producción de papel artesanal a partir de pulpas vegetales, y en general a apropiarse de la tecnología del libro, tal como lo apreciamos en esta hermosa edición, manufacturada por miembros de la cooperativa Nii Nomijamotima, coordinada por Sheroanawë Hakihiiwë.[/fill]",




}




var dialog_dict2 = {
	nada = "",
	historia1 = "[center]Primero ingles Relato del dueño del [color=yellow]fuego[/color][/center]",
	historia2 = "[center]Segundo InglesRelato del dueño del [color=yellow]fuego dos[/color][/center]",
	historia3 = "[fill]Tercero ingles del segundo[/fill]",
	historia4 = "[center]cuarto ingles del sgundo[/center]",


}


var dialog_dict3 = {
	nada = "",
	historia1 ="Totihitawe, Hola soy el chaman [b]yanomami[/b]",
	historia2 = "yano Segundo diálogo",
	historia3 = "yano Tercer diálogo",
	historia4 = "[center]Urraa yanomami... gracias por conseguir el fuego, ahora podremos comer nuestro alimento cocinado. Te daré una pluma de loro como agradecimiento.[/center]",






}

func _ready():
	add_to_group("dialogue_box")
	add_to_group("Idioma_GUI")
	set_opacity(0)
	texto = get_node("text")
	texto.set_size( get_size() - Vector2(50, 50) )
#	print (idioma)
	show_dialog( line )

	set_process(true)

#	idioma = get_owner().get_node("idioma_gui_save").idioma




#----Idiomas, viene de idioma gui------- 
func set_idioma1():
	idioma = 1

func set_idioma2():
	idioma = 2

#	get_tree().reload_current_scene()
func set_idioma3():
	idioma = 3

#----------------------------


func show_dialog( line ):
	if idioma == 1:
		texto.set_bbcode( dialog_dict[line] )
		set_opacity(opacidad)

	if idioma == 2:
		texto.set_bbcode( dialog_dict2[line] )
		set_opacity(opacidad)

	if idioma == 3:
		texto.set_bbcode( dialog_dict3[line] )
		set_opacity(opacidad)

#	print(dialog_dict[line])
#	print (idioma)










func _process(delta):
#	print(fade)
	
	if  adelante.check() == 3:
		_on_TouchScreenButton_adelante_pressed()
	if  atras.check() == 3:
		_on_TouchScreenButton_atras_pressed()



	if opacidad < 1:
		opacidad += 0.02
		show_dialog( line )

#-----------------------------
	if fade != 100:
		fade += 1

	if fade == 40:
		get_owner().get_node("AnimationPlayer").play("fade_in")


#----------------------------------
	if fade_frame != 100:
		fade_frame += 1







	#------------------------
	if historia == 0:
		end_dialog()
	
	if historia == 1:
		show_dialog(line)
		line = "historia1"
		if fade_frame == 40:
			get_owner().get_node("imagenes").set_frame(1)


	if historia == 2:
		show_dialog(line)
		line = "historia2"
		if fade_frame == 40:
			get_owner().get_node("imagenes").set_frame(2)
		
		
	if historia == 3:
		show_dialog(line)
		line = "historia3"
		if fade_frame == 40:
			get_owner().get_node("imagenes").set_frame(3)


	if historia == 4:
		show_dialog(line)
		line = "historia4"
		if fade_frame == 40:
			get_owner().get_node("imagenes").set_frame(4)


	if historia == 5:
		show_dialog(line)
		line = "historia5"
		if fade_frame == 40:
			get_owner().get_node("imagenes").set_frame(5)


	if historia == 6:
		show_dialog(line)
		line = "historia6"
		if fade_frame == 40:
			get_owner().get_node("imagenes").set_frame(6)




#---------------------------------
func _on_TouchScreenButton_adelante_pressed():
	if historia != 4:
		historia += 1
		opacidad = 0
		fade = 0
		fade_frame = 0
		get_owner().get_node("AnimationPlayer").play("fade_out")





func _on_TouchScreenButton_atras_pressed():
	if historia != 1:
		historia -= 1
		opacidad = 0
		fade = 0
		fade_frame = 0
		get_owner().get_node("AnimationPlayer").play("fade_out")







func end_dialog():
	set_opacity( 0 )
	texto.set_bbcode( "" )











