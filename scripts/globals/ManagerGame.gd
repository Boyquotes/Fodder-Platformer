extends Node

# pistol
# shotgun
# machine gun
# rocketlauncher
# homing missile
# bomerang
# bubble attack
# axe
# soccerball


signal item_picked(number)
signal weapon_produced(weapon_name)



var material_on_hand = ['', '']

var global_player_ref = null


func _ready():
	item_picked.connect(on_item_picked)


func produce_weapon():
	var w1 = material_on_hand[0]
	var w2 = material_on_hand[1]
	
	var weapon_suf = w1.to_pascal_case() + w2.to_pascal_case()
	
	var weapon = 'Weapon_%s' % weapon_suf
	
	global_player_ref.give_weapon(weapon)
#	weapon_produced.emit(weapon)
	
	
	material_on_hand[0] = ''
	material_on_hand[1] = ''
	


func on_item_picked(color: String):
	if material_on_hand[0] == '':
		material_on_hand[0] = color
	elif material_on_hand[1] == '':
		material_on_hand[1] = color
	
	if material_on_hand[0] == '' or material_on_hand[1] == '':
		return
	
	if material_on_hand[0] != '' and material_on_hand[1] != '':
		produce_weapon()
	
