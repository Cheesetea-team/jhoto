extends Node2D

export (Array, NodePath) var GoalItems = []
export (String) var next_level_scene = null
var aliveGoalItems: Array = []

func _ready() -> void:
	aliveGoalItems = GoalItems

func _process(_delta: float) -> void:
	var nitems = aliveGoalItems.size()
	if nitems == 0:
		if next_level_scene:
			var pl = get_parent().get_node("Player")
			if pl != null:
				pl._reset_player()
				pl._disable_player()
			if get_tree().change_scene(next_level_scene) != OK:
				print("Can't change scene!")
		else:
			get_tree().quit(0)
		
		
	var i = 0
	while i < nitems:
		var node = get_node_or_null(aliveGoalItems[i])
		if !node:
			aliveGoalItems.remove(i)
			nitems -= 1
		else:
			i += 1

#func _on_Portal_body_entered(body):
#	if body.name == "Player":
#		get_tree().change_scene("res://src/levels/"+escena+".tscn")
#	pass # Replace with function body.
