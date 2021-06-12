extends Actor

export (PackedScene) var object_trown
export (Vector2) var spawn_offset 
export (Vector2) var spawn_velocity

func _on_SpawnTimer_timeout() -> void:
	var obj = spawn()
	set_properties_to_newly_spawned_object(obj)

func set_properties_to_newly_spawned_object(obj) -> void:
	obj.global_position = global_position
	obj.position += spawn_offset
	if "linear_velocity" in obj:
		obj.linear_velocity = spawn_velocity

func spawn() -> PackedScene:
	if !object_trown:
		print("No object to spawn!")
		return null
	
	# Spawn
	var new_object = object_trown.instance()
	add_child(new_object)
	$Trow.play()
	return new_object

