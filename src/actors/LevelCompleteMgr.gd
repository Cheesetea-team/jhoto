extends Node2D

export (Array, NodePath) var GoalItems = []
export (String) var next_level_scene = null
var aliveGoalItems: Array = []
var next_level = null
var ending_level = false

func _ready() -> void:
	aliveGoalItems = GoalItems

func _process(_delta: float) -> void:
	var nitems = aliveGoalItems.size()
	if nitems == 0 && !ending_level:
		if next_level_scene:
			init_change_level(next_level_scene)
		else:
			get_tree().quit(0)
		
		
	var i = 0
	while i < nitems:
		var node = get_node_or_null(aliveGoalItems[i])
		if !node:
			aliveGoalItems.remove(i)
			nitems -= 1
			$goalItemSound.play()
		else:
			i += 1

# Init change level
func init_change_level(next_level_scene):
	# Set the next level instance
	next_level = next_level_scene
	# Try to notify the user
	var pl = get_parent().get_node("Player")
	if pl != null:
		# If user exist, we will wait for the level_exit animation to end
		pl.exit_level()
	else:
		# If can't find the user, change the level
		end_change_level()
	ending_level = true

# This actually changes the level
func end_change_level():
	if get_tree().change_scene(next_level) != OK:
		print("Can't change scene!")
#func _on_Portal_body_entered(body):
#	if body.name == "Player":
#		get_tree().change_scene("res://src/levels/"+escena+".tscn")
#	pass # Replace with function body.
