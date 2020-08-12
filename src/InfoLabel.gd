extends Label

func _ready():
	Globals.connect("game_over", self, "_on_game_over")

func _on_game_over():
	text = str(int(floor(Globals.get_game_time())), " seconds")
