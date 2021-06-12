extends KinematicBody2D

export (Vector2) var linear_velocity = Vector2(-100, 0)
export (String) var method_called_on_hit = "on_Arrow_hit"

##
## Hit receiving objects must define on_Arrow_hit() method
##
func _physics_process(_delta: float) -> void:
	var _err = move_and_slide(linear_velocity)
	if _notify_hit_objects():
		queue_free()
	
func _notify_hit_objects() -> bool:
	var nObjs = get_slide_count()
	if nObjs > 0:
		for i in range(nObjs):
			var collided = get_slide_collision(i).collider
			if collided.has_method(method_called_on_hit):
				collided.call(method_called_on_hit)
		return true
	return false
		

