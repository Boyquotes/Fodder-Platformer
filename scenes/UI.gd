extends Control


func _ready():
	ManagerGame.global_mat_slots.append($MaterialSlot)
	ManagerGame.global_mat_slots.append($MaterialSlot2)


func _physics_process(delta):
	if ManagerGame.material_on_hand[0] != '' and ManagerGame.material_on_hand[1] != '':
		$CraftLabel.show()
	else:
		$CraftLabel.hide()
