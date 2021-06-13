extends KinematicBody2D

func _on_CollectDetector_body_entered(body: Node) -> void:
	if body.get_name() == "Player":
		queue_free()
