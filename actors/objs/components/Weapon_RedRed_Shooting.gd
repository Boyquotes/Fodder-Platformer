extends Node2D


func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		ManagerGame.global_world_ref.spawn_bullet(1, global_position, 400.0)
