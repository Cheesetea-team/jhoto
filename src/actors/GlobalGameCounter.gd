extends Node

var playSeconds = 0.0
var deaths = 0

func _ready() -> void:
	stop()

func _on_ClockTimer_timeout() -> void:
	playSeconds += $ClockTimer.wait_time

func new_death() -> void:
	deaths += 1

func stop() -> void:
	$ClockTimer.stop()

func start() -> void:
	deaths = 0
	playSeconds = 0.0
	$ClockTimer.start()

func get_seconds_played() -> float:
	return playSeconds
