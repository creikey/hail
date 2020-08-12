extends Node2D

func _ready():
	randomize()
	Globals.connect("restart", self, "_on_restart")

func _on_restart():
	for c in get_children():
		if c is Timer:
			continue
		c.queue_free()

func _on_DecayingGameTimer_timeout():
	var game_size: Vector2 = Util.get_game_resolution()
	var new_repeller: Node2D = preload("res://RepellerPickup.tscn").instance()
	add_child(new_repeller)
	new_repeller.global_position = Vector2(
		rand_range(0, game_size.x),
		rand_range(0, game_size.y)
	)
