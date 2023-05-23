extends Panel

@export var slot_idx = 0


#func _ready():
#	ManagerGame.item_picked.connect(on_item_picked)


func on_item_picked(color: String):
	if color == '':
		$Icon.texture = null
		return
	
	$Icon.texture = load("res://reso/data/icons/material_%s.tres" % color)

