extends Actor

export (NodePath) var sibling_path = null
var sibling_node = null
var movement: = Vector2()

func _ready() -> void:
	if sibling_path:
		sibling_node = get_node(sibling_path)

func _physics_process(_delta: float) -> void:
	if movement:
		move_and_slide(movement)
		if sibling_node:
			sibling_node.move_and_slide(movement)
		movement = Vector2.ZERO
	
func _on_Player_pushbody(colid, linear_vel) -> void:
	if colid == get_instance_id():
		movement = linear_vel
