extends Node2D


var speed = .3
var tick = 0.0


func _process(delta):
	if Input.is_action_pressed("shoot"):
		tick += delta
		
		if tick > speed:
			ManagerGame.global_world_ref.spawn_bullet(1, $BulletSpawn.global_position, 400.0)
			
			tick = 0.0


func _physics_process(delta):
	var dir = global_position.direction_to(get_global_mouse_position())
	if dir.x < -0.5:
		get_node('%Gun1').flip_v = true
		get_node('%Gun2').flip_v = true
	else:
		get_node('%Gun1').flip_v = false
		get_node('%Gun2').flip_v = false
	
	self.look_at(get_global_mouse_position())
