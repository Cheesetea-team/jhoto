extends TileMap

func _ready() -> void:
	var global = get_node("/root/GlobalGameCounter")
	if !global:
		print("Error getting global Game Counter")
	else:
		global.start()
