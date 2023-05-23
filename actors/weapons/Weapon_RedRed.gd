extends Node2D



func _physics_process(delta):
	var dir = global_position.direction_to(get_global_mouse_position())
	if dir.x < -0.5:
		get_node('%Sprite2D').flip_h = true
		get_node('%Sprite2D2').flip_h = true
	else:
		get_node('%Sprite2D').flip_h = false
		get_node('%Sprite2D2').flip_h = false
	
#	$Sprite2D.look_at(get_global_mouse_position())
