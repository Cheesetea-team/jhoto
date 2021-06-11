extends Actor

var movement = Vector2()

func _physics_process(_delta: float) -> void:
	if movement:
		move_and_slide(movement)
		movement = Vector2.ZERO
	
func _on_Player_pushbody(colid, linear_vel) -> void:
	if colid == get_instance_id():
		movement = linear_vel
