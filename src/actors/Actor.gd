extends KinematicBody2D
class_name Actor

export var speed = Vector2.ZERO


func _physics_process(delta: float) -> void:
	move_and_slide(Vector2(100, 0))
