extends Node

class_name Util

static func get_game_resolution() -> Vector2:
	var width: float = ProjectSettings.get_setting("display/window/size/width")
	var height: float = ProjectSettings.get_setting("display/window/size/height")
	
	return Vector2(width, height)

static func secondary_button_pressed(event: InputEvent) -> bool:
	return event.is_pressed() and (not event.is_echo()) and (event is InputEventScreenTouch or \
		event is InputEventKey or \
		(event.device == 0 and event is InputEventJoypadButton))
