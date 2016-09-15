extends Control
 
#var fuente
var tema_arabe
var descripcion

# NOTE: Changing locale will not change the text in the controls,
#       The scene must be reloaded for changes to take effect.

func ready():
#	fuente = get_node("AnimationPlayer")
	set_process(true)

#	pass

func _process(delta):
	get_node("Sprite2").rotate(3)





func _on_Button_pressed():
	get_tree().change_scene("res://elementos/menu.scn")
#	get_node().goto_scene("res://../niveles/level_01B.xml")
#	get_node("/root/global").goto_scene("res://elementos/menu.scn")



func _on_english_pressed():
	TranslationServer.set_locale("en")
#	_goto_scene()
	get_tree().reload_current_scene()








func _on_spanish_pressed():
	TranslationServer.set_locale("es")
#	_goto_scene()
	get_tree().reload_current_scene()







func _on_japanese_pressed():
	TranslationServer.set_locale("ms") # yanomami
#	_goto_scene()
	get_tree().reload_current_scene()





func _on_chino_pressed():
	TranslationServer.set_locale("zh") # Japones
#	_goto_scene()
	get_tree().reload_current_scene()





func _on_portugues_pressed():
	TranslationServer.set_locale("pt_BR")
#	_goto_scene()
	get_tree().reload_current_scene()





func _on_arabe_pressed():
	TranslationServer.set_locale("ar")
#	_goto_scene()
	get_tree().reload_current_scene()


	



func _on_ruso_pressed():
	TranslationServer.set_locale("ru")
#	_goto_scene()
	get_tree().reload_current_scene()





func _on_japones_pressed():
	TranslationServer.set_locale("ja_JP")
#	_goto_scene()
	get_tree().reload_current_scene()




