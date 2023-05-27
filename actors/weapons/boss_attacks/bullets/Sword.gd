extends Node2D




func _on_animation_player_animation_finished(anim_name):
	if anim_name == 'lit':
		$AnimationPlayer.play("swing")
	if anim_name == 'swing':
		queue_free()
