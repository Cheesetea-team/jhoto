extends Actor

export var speed = Vector2.ZERO
var movement = Vector2()

func _physics_process(_delta: float) -> void:
	move_and_slide(movement * speed)
	
func set_movement(mov: Vector2) -> void:
	movement = mov
