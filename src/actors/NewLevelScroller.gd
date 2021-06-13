extends CanvasLayer

export var scroll_speed = Vector2(-500, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	$NewLevelLabel.rect_position += scroll_speed*delta
	if $NewLevelLabel.rect_position.x < -2000:
		queue_free()
