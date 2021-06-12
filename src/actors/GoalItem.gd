extends KinematicBody2D



func _on_CollectDetector_body_entered(_body: Node) -> void:
	queue_free()
