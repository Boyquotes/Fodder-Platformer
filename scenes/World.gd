extends Node2D


@onready var sort = $Sort
@onready var drop_spawn = $DropSpawn.global_position






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
