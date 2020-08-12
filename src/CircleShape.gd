tool
extends CollisionShape2D

export var radius: float = 5.0 setget set_radius
export var color := Color() setget set_color

onready var _circle_visual: Circle = $Circle

func set_radius(new_radius):
	radius = new_radius
	shape.radius = radius
	if _circle_visual != null:
		_circle_visual.radius = radius

func set_color(new_color):
	color = new_color
	if _circle_visual != null:
		_circle_visual.color = color

func _ready():
	assert(shape is CircleShape2D)
	self.radius = radius
	self.color = color
