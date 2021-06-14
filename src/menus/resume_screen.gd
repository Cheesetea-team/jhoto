extends CanvasLayer


export var next_level = "res://src/menus/menu_principal.tscn"
var cont = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$resume_screen_win.visible = true
	cont = false
	var global = get_node("/root/GlobalGameCounter")
	if !global:
		print("Error getting global Game Counter")
	else:
		var level = global.get_level()
		$level.text  = "%d" % level
		$deaths.text = "%d" % global.get_deaths()
		$time.text   = "%.1f secs" % global.get_seconds_played()
		if level != 13:
			$resume_screen_win.visible = false
		

func _process(_delta: float) -> void:
	if cont:
		if get_tree().change_scene(next_level) != OK:
			print("Can't change scene!")

func _input(event):
	if event is InputEventKey || event is InputEventMouseButton:
		if event.pressed:
			cont = true
