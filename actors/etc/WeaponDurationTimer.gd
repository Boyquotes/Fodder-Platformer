extends Timer



func _on_timeout():
	ManagerGame.global_player_ref.remove_weapon()
	
	ManagerGame.weapon_expired.emit()
	
	get_parent().queue_free()
