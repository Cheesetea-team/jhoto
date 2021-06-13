extends Node

var playSeconds = 0.0
var deaths = 0
var levels = 1

func _ready() -> void:
	stop()

func _on_ClockTimer_timeout() -> void:
	playSeconds += $ClockTimer.wait_time
	#print("%f %d %d" % [playSeconds, levels, deaths ])

func new_death() -> void:
	deaths += 1

func new_level() -> void:
	levels += 1

func get_level() -> int:
	return levels

func get_deaths() -> int:
	return deaths
	
func get_seconds_played() -> float:
	return playSeconds

func start() -> void:
	levels = 1
	deaths = 0
	playSeconds = 0.0
	$ClockTimer.start()

func stop() -> void:
	$ClockTimer.stop()

