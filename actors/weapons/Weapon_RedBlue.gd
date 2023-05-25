extends Node2D

@onready var gun = $Node2D/Gun1

var speed = .1
var tick = 0.0


func _process(delta):
	if Input.is_action_pressed("shoot"):
		tick += delta
		
		if tick > speed:
			ManagerGame.global_world_ref.spawn_bullet(1, global_position, 400.0)
			
			tick = 0.0


func _physics_process(delta):
	var dir = global_position.direction_to(get_global_mouse_position())
	if dir.x < -0.5:
		gun.flip_v = true
	else:
		gun.flip_v = false
	
	self.look_at(get_global_mouse_position())
