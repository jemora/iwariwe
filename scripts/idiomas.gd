
extends Panel
 

#func _goto_scene():
#	var s = load("res://idiomas.scn")
#	var si = s.instance()
#	get_parent().add_child(si)
#	queue_free()




# NOTE: Changing locale will not change the text in the controls,
#       The scene must be reloaded for changes to take effect.




func _on_english_pressed():
	TranslationServer.set_locale("en")
#	_goto_scene()
	get_tree().reload_current_scene()






func _on_spanish_pressed():
	TranslationServer.set_locale("es")
#	_goto_scene()
	get_tree().reload_current_scene()







func _on_japanese_pressed():
	TranslationServer.set_locale("ja")
#	_goto_scene()
	get_tree().reload_current_scene()




func _on_Button_pressed():
	get_tree().change_scene("res://elementos/menu.scn")
#	get_node().goto_scene("res://../niveles/level_01B.xml")

