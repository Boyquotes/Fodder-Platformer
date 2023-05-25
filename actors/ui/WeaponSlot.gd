extends TextureRect




func _ready():
	ManagerGame.global_weapon_slot = self
	ManagerGame.weapon_expired.connect(on_weapon_expired)


func display(weapon_name: String):
	texture = load("res://reso/data/icons/%s.tres" % weapon_name)

func on_weapon_expired():
	texture = null
