extends TextureRect

export var play_scene: 		= "res://src/levels/level_1.tscn"
export var credits_scene: 	= "res://src/menus/Credits.tscn"

func _on_Boton_jugar_pressed() -> void:
	get_tree().change_scene(play_scene)


func _on_Boton_Creditos_pressed() -> void:
	get_tree().change_scene(credits_scene)


func _on_Boton_salir_pressed() -> void:
	get_tree().quit(0)
