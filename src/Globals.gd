extends Node

signal game_over
signal restart

var _player_dead: bool = false
var _game_time: float = 0.0

func _process(delta):
	if is_player_alive():
		_game_time += delta

func _input(event):
#	print(event)
	if is_player_alive():
		return
	if Util.secondary_button_pressed(event):
		_restart()

func _restart():
	_player_dead = false
	_game_time = 0.0
	emit_signal("restart")

func get_game_time() -> float:
	return _game_time

func kill_player():
	_player_dead = true
	emit_signal("game_over")

func is_player_dead() -> bool:
	return _player_dead

func is_player_alive() -> bool:
	return not _player_dead
