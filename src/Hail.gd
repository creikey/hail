extends RigidBody2D

class_name Hail

const MOVING_FORCE = 800.0
const MAX_VELOCITY = 200.0
const MARGIN = 20.0

var moving_direction := Vector2()
var _can_die: bool = false

func _ready():
	randomize()

func update_trajectory():
	var target_point: Vector2 = Util.get_game_resolution()/2.0
	
	target_point += Vector2(
		rand_range(-100.0, 100.0),
		rand_range(-100.0, 100.0)
	)
	
	moving_direction = (target_point - global_position).normalized()

func _physics_process(_delta):
	applied_force = moving_direction * MOVING_FORCE
	applied_force -= (linear_velocity.length()/MAX_VELOCITY)*linear_velocity
	if _can_die and not Rect2(Vector2(-1, -1)*MARGIN, Util.get_game_resolution() + Vector2(1, 1)*MARGIN).has_point(global_position):
		queue_free()

func _on_CanDieTimer_timeout():
	_can_die = true
	
