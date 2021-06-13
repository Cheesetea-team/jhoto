extends ParallaxLayer
export var velocidad = 0
var offset = 0

func _ready():
	offset = 0
	set_process(true)
	pass # Replace with function body.

func _process(delta):
	offset -= velocidad * delta
	if offset < -1800:
		offset = 0
	motion_offset  = Vector2(0,offset)
