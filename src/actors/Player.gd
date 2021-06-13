extends Actor

export var speed = Vector2.ZERO
var movement = Vector2()
var initial_position = Vector2()
var animating = true

func _ready() -> void:
	# Start animation
	init_entry_anim()
	initial_position = global_position
	self._disable_player()

# Hit by an arrow (to be called directly)
func on_Arrow_hit():
	_disable_player()
	if !$AnimatedSprite.is_connected("animation_finished", self, "_reset_player"):	
		$AnimatedSprite.connect("animation_finished", self, "_reset_player")
	$AnimatedSprite.playing = true
	$AnimatedSprite.animation = "dead"
	$deathSound.play()

func _reset_player():
	global_position = initial_position
	if $AnimatedSprite.is_connected("animation_finished", self, "_reset_player"):	
		$AnimatedSprite.disconnect("animation_finished", self, "_reset_player")
	_enable_player()
	# Entry level animation
	

func _enable_player():
	set_process(true)
	set_physics_process(true)
	$CollisionShape2D.disabled = false
	$AnimatedSprite.playing = false
	$AnimatedSprite.animation = "right"

func _disable_player():
	set_process(false)
	set_physics_process(false)
	$CollisionShape2D.disabled = true

func init_entry_anim():
	$levelEntrySound.play()
	animating = true
	$AnimatedSprite.animation = "level_enter"
	$AnimatedSprite.playing = true
	$AnimatedSprite.frame = 0
	$AnimatedSprite.connect("animation_finished" , self, "on_animation_end")
	
func _process(_delta: float) -> void:
	if Input.is_action_pressed("reset"):
		get_tree().reload_current_scene()
	elif Input.is_action_pressed("exit"):
		get_tree().change_scene("res://src/menus/menu_principal.tscn")
	var mr = int(Input.is_action_pressed("move_right"))
	var ml = int(Input.is_action_pressed("move_left"))
	var mu = int(Input.is_action_pressed("move_up"))
	var md = int(Input.is_action_pressed("move_down"))
	movement = Vector2(mr - ml, md - mu)
	
	# Set animation
	$AnimatedSprite.playing = true
	if mr:
		$AnimatedSprite.animation = "right"
	elif ml:
		$AnimatedSprite.animation = "left"
	elif mu:
		$AnimatedSprite.animation = "up"
	elif md:
		$AnimatedSprite.animation = "down"
	elif animating == false:
		$AnimatedSprite.playing = false

func _physics_process(_delta: float) -> void:
	move_and_slide(movement * speed)
	var ncols = get_slide_count()
	for i in range(ncols):
		var c = get_slide_collision(i)
		emit_signal("pushbody", c.collider_id, movement*speed)

func on_animation_end():
	animating = false
	if $AnimatedSprite.animation == "level_enter":
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.playing = false
		if ($AnimatedSprite.is_connected("animation_finished", self, "on_animation_end")):
			$AnimatedSprite.disconnect("animation_finished", self, "on_animation_end")
		self._enable_player()

func exit_level():
	# Disable movement	
	self._disable_player()
	
	# Start animation
	$AnimatedSprite.playing = false
	$AnimatedSprite.animation = "level_exit"
	$AnimatedSprite.playing = true
	$levelExitSound.play()
	
	# Set the flag that prevents anim change
	animating = true
	
	#Disconnect event
	if ($AnimatedSprite.is_connected("animation_finished", self, "on_animation_end")):
		$AnimatedSprite.disconnect("animation_finished", self, "on_animation_end")
	
	# Notify when the anim ends
	var level_manager = get_parent().get_node("LevelCompleteManager")
	if(level_manager != null):
		$AnimatedSprite.connect("animation_finished", level_manager, "end_change_level")
	
