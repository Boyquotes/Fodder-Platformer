extends Node2D



var dir
var speed = 0.0

var is_reverse = false

func _physics_process(delta):
	if is_reverse == false:
		global_position += dir * speed * delta
	else:
		dir = global_position.direction_to(ManagerGame.global_player_ref.global_position)
		global_position += dir * speed * delta
		
		if global_position.distance_to(ManagerGame.global_player_ref.global_position) < 5.0:
			queue_free()
		


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_go_back_timer_timeout():
	is_reverse = true
