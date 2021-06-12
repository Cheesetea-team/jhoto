extends KinematicBody2D



func _on_CollectDetector_body_entered(body: Node) -> void:
	queue_free()
