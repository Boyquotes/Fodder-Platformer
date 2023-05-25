extends Area2D

@export var hp = 10

@onready var parent = get_parent()


func _on_area_entered(area):
	hp -= 1
	
	parent.get_node('Anim').play('hit')
	
	if hp <= 0:
		parent.queue_free()
