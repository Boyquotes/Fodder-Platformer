extends Node2D



func _process(delta):
	pass


func _physics_process(delta):
	var dir = global_position.direction_to(get_global_mouse_position())
	if dir.x < -0.5:
		get_node('%Gun1').flip_v = true
		get_node('%Gun2').flip_v = true
	else:
		get_node('%Gun1').flip_v = false
		get_node('%Gun2').flip_v = false
	
	$Node2D.look_at(get_global_mouse_position())
