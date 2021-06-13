extends Light2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time = 0.0
var time_rate = 0.07
var max_inc = 0.3
var min_inc = 0.1
var base_energy = 3
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if (time >= time_rate):
		rng.randomize()
		energy = base_energy + rng.randf_range(-min_inc, max_inc)
		time = 0
	pass
