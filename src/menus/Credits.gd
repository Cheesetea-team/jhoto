extends CanvasLayer

export var main_menu_scene = "res://src/menus/menu_principal.tscn"

func _process(_delta: float) -> void:
	var cancel = Input.is_action_pressed("exit")
	var accept = Input.is_action_pressed("continue")
	if cancel or accept:
		if get_tree().change_scene(main_menu_scene) != OK:
			print("Can't change scene!")
