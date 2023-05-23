extends Control


func _ready():
	ManagerGame.global_mat_slots.append($MaterialSlot)
	ManagerGame.global_mat_slots.append($MaterialSlot2)
