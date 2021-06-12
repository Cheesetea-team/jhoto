extends CanvasLayer

export var main_menu_scene = "res://src/menus/menu_principal.tscn"

func _process(delta: float) -> void:
	var cancel = Input.is_action_pressed("ui_cancel")
	var accept = Input.is_action_pressed("ui_accept")
	if cancel or accept:
		get_tree().change_scene(main_menu_scene)
