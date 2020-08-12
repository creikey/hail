extends RigidBody2D

signal dead

const JOY_INDEX = 0
const MAX_VELOCITY = 1500.0
const MOVE_FORCE = 5000.0

func _ready():
	global_position = Util.get_game_resolution()/2.0

func _physics_process(_delta):
	var movement := Vector2(
		float(Input.is_action_pressed("g_right")) - float(Input.is_action_pressed("g_left")),
		-float(Input.is_action_pressed("g_up")) + float(Input.is_action_pressed("g_down"))
	).normalized()
	movement += Vector2(
		Input.get_joy_axis(JOY_INDEX, 0),
		Input.get_joy_axis(JOY_INDEX, 1)
	)
	if movement.length() > 0.3:
		applied_force = movement*MOVE_FORCE
#	print(linear_velocity.length())
	applied_force -= (linear_velocity.length()/MAX_VELOCITY)*MOVE_FORCE*linear_velocity.normalized()
#	print(applied_force.length())


func _on_Player_body_entered(body):
	if body.is_in_group("hail"):
		Globals.kill_player()
		var death_animation: Node2D = preload("res://PlayerDeathAnimation.tscn").instance()
		get_parent().add_child(death_animation)
		death_animation.global_transform = global_transform
		queue_free()
