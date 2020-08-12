tool
extends Node2D

class_name Circle

export var color := Color() setget set_color
export var radius := 5.0 setget set_radius

func set_color(new_color):
	color = new_color
	update()

func set_radius(new_radius):
	radius = new_radius
	update()

func _draw():
	draw_circle(Vector2(), radius, color)
