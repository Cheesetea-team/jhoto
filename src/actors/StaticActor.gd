extends Node2D
class_name StaticActor

export (int) var y_correction = 1000

func _ready() -> void:
	z_index = y_correction + position.y
