extends TextureButton

export var launch_scene: = "res://src/levels/level_1.tscn"

func _on_Boton_jugar_pressed() -> void:
	get_tree().change_scene(launch_scene)
