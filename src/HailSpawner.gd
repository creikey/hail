extends Node2D

class_name HailSpawner

const MARGIN: float = 20.0

export (Curve) var _respawn_time_progression
export var _total_game_time: float = 120.01

onready var _spawn_timer: Timer = $SpawnTimer

func _ready():
	randomize()

func clear_hail():
	for c in get_children():
		if c is Hail:
			c.queue_free()

func spawn_hail():
	var dimensions: Vector2 = Util.get_game_resolution()
	var screen_square_length: float = max(dimensions.x, dimensions.y)
	var screen_square_diagonal: float = sqrt(screen_square_length*screen_square_length)
	var screen_radius: float = screen_square_diagonal
	var theta: float = rand_range(0.0, 2.0*PI)
	var new_hail_position := Vector2(
		sin(theta),
		cos(theta)
	) * screen_radius + dimensions/2.0
#	print(new_hail_position)
	var new_hail: Node2D = preload("res://Hail.tscn").instance()
	add_child(new_hail)
	new_hail.global_position = new_hail_position
	new_hail.update_trajectory()


func _on_SpawnTimer_timeout():
	spawn_hail()
	_spawn_timer.wait_time = _respawn_time_progression.interpolate_baked(min(1.0, Globals.get_game_time()/_total_game_time))
	_spawn_timer.start()
