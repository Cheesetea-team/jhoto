extends Actor

export var speed = Vector2.ZERO
var movement = Vector2()

func _process(_delta: float) -> void:
	var mr = int(Input.is_action_pressed("ui_right"))
	var ml = int(Input.is_action_pressed("ui_left"))
	var mu = int(Input.is_action_pressed("ui_up"))
	var md = int(Input.is_action_pressed("ui_down"))
	movement = Vector2(mr - ml, md - mu)

func _physics_process(_delta: float) -> void:
	move_and_slide(movement * speed)
