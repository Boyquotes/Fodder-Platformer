extends RigidBody2D


@export var color = ''


func _ready():
	match color:
		'red': $Icon.texture = load("res://assets/UI/Weapon Materials/Item - Pixel Cube (Red).png")
		'green': $Icon.texture = load("res://assets/UI/Weapon Materials/Item - Pixel Cube (Green).png")
		'blue': $Icon.texture = load("res://assets/UI/Weapon Materials/Item - Pixel Cube (Blue).png")


func _on_delete_timer_timeout():
	queue_free()
