extends CanvasLayer

export var next_level = "res://src/levels/level_0.tscn"
var cont = false

func _ready() -> void:
	var global = get_node("/root/GlobalGameCounter")
	if !global:
		print("Error getting global Game Counter")
	else:
		global.stop()

func _process(_delta: float) -> void:
	if cont:
		if get_tree().change_scene(next_level) != OK:
			print("Can't change scene!")

func _input(event):
	if event is InputEventKey || event is InputEventMouseButton:
		if event.pressed:
			cont = true
