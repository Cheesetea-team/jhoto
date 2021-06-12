extends CanvasLayer

export var main_menu_scene = "res://src/menus/menu_principal.tscn"

func _process(_delta: float) -> void:
	var cancel = Input.is_action_pressed("ui_cancel")
	var accept = Input.is_action_pressed("ui_accept")
	if cancel or accept:
		if !get_tree().change_scene(main_menu_scene):
			print("Can't change scene!")
