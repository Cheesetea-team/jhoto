extends KinematicBody2D
class_name Actor

export (int) var y_correction = 1000

signal pushbody(colid, linear_vel) 

func _process(delta: float) -> void:
	z_index = y_correction + position.y
