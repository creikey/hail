extends Timer


export (Curve) var _time_progression
export var _total_game_time: float = 120

func _ready():
	Globals.connect("restart", self, "_on_restart")

func _on_restart():
	stop()
	_on_DecayingGameTimer_timeout()

func _on_DecayingGameTimer_timeout():
	wait_time = _time_progression.interpolate_baked(min(1.0, Globals.get_game_time()/_total_game_time))
	start()
