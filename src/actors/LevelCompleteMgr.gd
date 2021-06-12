extends Node2D

export (Array, NodePath) var GoalItems = []
export (String) var next_level_scene = null
var aliveGoalItems: Array = []

func _ready() -> void:
	aliveGoalItems = GoalItems

func _process(delta: float) -> void:
	var nitems = aliveGoalItems.size()
	if nitems == 0:
		print("Level Complete!")
		if next_level_scene:
			print(next_level_scene)
			get_tree().change_scene(next_level_scene)
		else:
			get_tree().quit(0)
		
		
	var i = 0
	while i < nitems:
		var node = get_node_or_null(aliveGoalItems[i])
		if !node:
			print("Goalitem obtained!")
			aliveGoalItems.remove(i)
			nitems -= 1
		else:
			i += 1

#func _on_Portal_body_entered(body):
#	if body.name == "Player":
#		get_tree().change_scene("res://src/levels/"+escena+".tscn")
#	pass # Replace with function body.
