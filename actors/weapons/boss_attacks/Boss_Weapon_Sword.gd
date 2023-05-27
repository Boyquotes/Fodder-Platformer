extends Node2D


func _on_timer_timeout():
	var pos = ManagerGame.global_player_ref.global_position
	
	var s = load("res://actors/weapons/boss_attacks/bullets/Sword.tscn").instantiate()
	s.global_position = pos
	ManagerGame.global_world_ref.sort.add_child(s)
