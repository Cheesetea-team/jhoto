extends Node2D

export (Array, NodePath) var GoalItems = []
export (String) var next_level_num = null
export (String) var game_end_scene = "res://src/menus/resume_screen.tscn"
var scene_path_prefix  = "res://src/levels/level_"
var scene_path_postfix = ".tscn"
var aliveGoalItems: Array = []
#var next_level = null
var ending_level = false

func _ready() -> void:
	aliveGoalItems = GoalItems
	_init_new_level_scroller()
	
func _init_new_level_scroller():
	var level = 1
	var global = get_node("/root/GlobalGameCounter")
	if !global:
		print("Error getting global Game Counter")
	else:
		level = global.get_level()
	$NewLevelScroller.get_node("NewLevelLabel").text = "LEVEL %d" % [ level ]

func _process(_delta: float) -> void:
	var nitems = aliveGoalItems.size()
	if nitems == 0 && !ending_level:
		if next_level_num:
			init_change_level()
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
func init_change_level():
	# Try to notify the user
	var pl = get_parent().get_node("Player")
	if pl != null:
		# If user exist, we will wait for the level_exit animation to end
		pl.exit_level()
	else:
		# If can't find the user, change the level
		end_change_level()
	ending_level = true
	_count_new_level()

# This actually changes the level
func end_change_level():
	if next_level_num == "end":
		get_tree().change_scene(game_end_scene)
	var next_level = scene_path_prefix + next_level_num + scene_path_postfix
	if get_tree().change_scene(next_level) != OK:
		print("Can't change scene!")

func _count_new_level():
	var global = get_node("/root/GlobalGameCounter")
	if !global:
		print("Error getting global Game Counter")
	else:
		global.new_level()
	
