extends Actor

var movement = Vector2()

func _physics_process(_delta: float) -> void:
	if movement:
		move_and_slide(movement)
	

func _on_Player_pushbody(linear_vel) -> void:
	movement = linear_vel
