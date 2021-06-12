extends Actor

export var speed = Vector2.ZERO
var movement = Vector2()
var initial_position = Vector2()

func _ready() -> void:
	initial_position = global_position

# Hit by an arrow (to be called directly)
func on_Arrow_hit():
	_disable_player()
	$AnimatedSprite.connect("animation_finished", self, "_reset_player")
	$AnimatedSprite.playing = true
	$AnimatedSprite.animation = "dead"
	$AudioStreamPlayer.play()

func _reset_player():
	global_position = initial_position
	$AnimatedSprite.disconnect("animation_finished", self, "_reset_player")
	_enable_player()

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
	
func _process(_delta: float) -> void:
	var mr = int(Input.is_action_pressed("ui_right"))
	var ml = int(Input.is_action_pressed("ui_left"))
	var mu = int(Input.is_action_pressed("ui_up"))
	var md = int(Input.is_action_pressed("ui_down"))
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
	else:
		$AnimatedSprite.playing = false

func _physics_process(_delta: float) -> void:
	move_and_slide(movement * speed)
	var ncols = get_slide_count()
	for i in range(ncols):
		var c = get_slide_collision(i)
		emit_signal("pushbody", c.collider_id, movement*speed)
