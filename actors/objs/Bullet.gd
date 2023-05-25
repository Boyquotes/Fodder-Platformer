extends Node2D


var dir
var speed = 300.0

func _physics_process(delta):
	global_position += dir * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
