extends Node2D

var dir
var speed

func _ready():
	set_physics_process(false)
	
	var t = create_tween()
	var d = global_position.direction_to(get_global_mouse_position())
	
	t.tween_property(self, 'global_position', global_position + (d * 90), .6).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	
	await t.finished
	
	set_physics_process(true)
#	t.tween_property(self, 'global_position', ManagerGame.global_boss_ref.global_position, .6)


func _physics_process(delta):
	var dif = global_position.direction_to(ManagerGame.global_boss_ref.global_position)
	
	global_position += dif * speed * delta


func _on_area_2d_area_entered(area):
	queue_free()
