extends Timer



func _on_timeout():
	ManagerGame.global_player_ref.remove_weapon()
	
	get_parent().queue_free()
