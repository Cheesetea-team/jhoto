extends TextureRect

export var play_scene: 		= "res://src/levels/level_0.tscn"
export var credits_scene: 	= "res://src/menus/Credits.tscn"

func _on_Boton_jugar_pressed() -> void:
	$MenuMusic.stop()
	if get_tree().change_scene(play_scene) != OK:
		print("Can't change scene!")

func _on_Boton_Creditos_pressed() -> void:
	$MenuMusic.stop()
	if get_tree().change_scene(credits_scene) != OK:
		print("Can't change scene!")

func _on_Boton_salir_pressed() -> void:
	$MenuMusic.stop()
	get_tree().quit(0)
