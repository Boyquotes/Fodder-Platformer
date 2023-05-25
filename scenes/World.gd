extends Node2D


@onready var sort = $Sort
@onready var drop_spawn = $DropSpawn.global_position


func _ready():
	ManagerGame.global_world_ref = self


func spawn_bullet(amount: int = 1, spawn_pos: Vector2 = Vector2.ZERO, speed = 400.0):
	for i in range(amount):
		var b = load("res://actors/objs/Bullet.tscn").instantiate()
		b.global_position = spawn_pos
		b.speed = speed
		
		var m_pos = get_global_mouse_position()
		var rand_x = randf_range(m_pos.x - 32, m_pos.x + 32)
		var rand_y = randf_range(m_pos.y - 32, m_pos.y + 32)
		
		b.dir = b.global_position.direction_to(Vector2(rand_x, rand_y))
		
		sort.add_child(b)


func _on_material_drop_timer_timeout():
	randomize()
	var color = ''
	
	var rand = randi() % 3
	match rand:
		0: color = 'red'
		1: color = 'green'
		2: color = 'blue'
	
	var rand_x = randf_range(drop_spawn.x - 200, drop_spawn.x + 200)
	var rand_spawn = Vector2(rand_x, drop_spawn.y)
	
	var mat = load("res://actors/objs/Item.tscn").instantiate()
	mat.global_position = rand_spawn
	mat.color = color
	sort.add_child(mat)
