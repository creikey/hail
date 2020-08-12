extends Node2D

export (NodePath) var _game_root_path
export (NodePath) var _hail_spawner_path

onready var _game_root: Node = get_node(_game_root_path)
onready var _hail_spawner: HailSpawner = get_node(_hail_spawner_path)
onready var _animation_player: AnimationPlayer = $AnimationPlayer


func _ready():
	Globals.connect("game_over", self, "_on_game_over")
	Globals.connect("restart", self, "_on_restart")
	_spawn_player()

func _on_restart():
	_animation_player.play("restart")
	_spawn_player()

func _on_game_over():
	$AnimationPlayer.play("game_over")

func _spawn_player():
	var new_player: Node2D = preload("res://Player.tscn").instance()
	_game_root.add_child(new_player)
	new_player.connect("dead", self, "_on_player_dead")


func _on_DecayingGameTimer_timeout():
	pass # Replace with function body.
