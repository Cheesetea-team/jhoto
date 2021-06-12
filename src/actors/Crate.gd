extends Actor

export (NodePath) var sibling_path = null
var sibling_node = null
var marker = null
var movement: = Vector2()

func _ready() -> void:
	if sibling_path:
		sibling_node = get_node(sibling_path)
		marker = get_node("Marker")
		var target = sibling_node.global_position - marker.global_position
		var angle = (atan2(target.y, target.x))
		marker.rotation = angle

func _process(delta):
	if sibling_path:
		sibling_node = get_node(sibling_path)
		marker = get_node("Marker")
		var target = sibling_node.global_position - marker.global_position
		var angle = (atan2(target.y, target.x))
		marker.rotation = angle + PI/2

func _physics_process(_delta: float) -> void:
	var _err
	if movement:
		_err = move_and_slide(movement)
		if sibling_node:
			_err = sibling_node.move_and_slide(movement)
		movement = Vector2.ZERO
	
func _on_Player_pushbody(colid, linear_vel) -> void:
	if colid == get_instance_id():
		movement = linear_vel
