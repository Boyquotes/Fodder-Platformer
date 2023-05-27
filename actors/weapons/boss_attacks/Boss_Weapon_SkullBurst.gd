extends Node2D



func _ready():
	pass


func _on_timer_timeout():
	for i in range(6):
		var skull = load("res://actors/weapons/boss_attacks/bullets/Skull.tscn").instantiate()
		
		ManagerGame.global_world_ref.get_node('Sort').add_child(skull)
