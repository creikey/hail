extends Area2D

func _ready():
	Globals.connect("restart", self, "_on_restart")

func _on_restart():
	queue_free()

func _physics_process(_delta):
	for b in get_overlapping_bodies():
		if b.is_in_group("knows_about_repellers"):
			b.in_repeller = true


func _on_RepellerEffector_body_exited(body):
	if body.is_in_group("knows_about_repellers"):
		body.set_deferred("in_repeller", false)
