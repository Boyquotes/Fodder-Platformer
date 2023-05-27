extends Node2D

@onready var gun = $Node2D/Gun1

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		ManagerGame.global_world_ref.spawn_bullet(1, global_position, 200.0, 3)
		
		$WeaponDurationTimer._on_timeout()


func _physics_process(delta):
	var dir = global_position.direction_to(get_global_mouse_position())
	if dir.x < -0.5:
		gun.flip_v = true
	else:
		gun.flip_v = false
	
	self.look_at(get_global_mouse_position())
