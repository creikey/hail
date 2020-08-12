extends Node

class_name Util

static func get_game_resolution() -> Vector2:
	var width: float = ProjectSettings.get_setting("display/window/size/width")
	var height: float = ProjectSettings.get_setting("display/window/size/height")
	
	return Vector2(width, height)
