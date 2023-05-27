extends Node2D



func _ready():
	pass


func _on_timer_timeout():
	var count = 8
	var radius = Vector2(1, 0)
	var step = 2 * PI / count
	
	for i in range(count):
		var skull = load("res://actors/weapons/boss_attacks/bullets/Skull.tscn").instantiate()
		skull.global_position = global_position
		skull.dir = radius.rotated(step * i)
		
		ManagerGame.global_world_ref.sort.add_child(skull)
