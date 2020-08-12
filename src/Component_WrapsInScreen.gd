extends Node

class_name Component_WrapsInScreen

const SCREEN_WRAP_MARGIN = 10.0

onready var _to_control: Node2D = get_parent()

func _process(_delta):
	var screen_size: Vector2 = Util.get_game_resolution()
	screen_size.x += SCREEN_WRAP_MARGIN
	screen_size.y += SCREEN_WRAP_MARGIN

	# horizontal
	if _to_control.global_position.x < -SCREEN_WRAP_MARGIN:
		_to_control.global_position.x += screen_size.x
	elif _to_control.global_position.x > screen_size.x:
		_to_control.global_position.x -= screen_size.x

	# vertical
	if _to_control.global_position.y < -SCREEN_WRAP_MARGIN:
		_to_control.global_position.y += screen_size.y
	elif _to_control.global_position.y > screen_size.y:
		_to_control.global_position.y -= screen_size.y
