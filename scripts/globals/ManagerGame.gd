extends Node

# pistol --
# shotgun --
# machine gun --
# rocketlauncher --
# homing missile --
# bomerang -- 
# bubble attack
# axe --
# soccerball


signal item_picked(str)
signal weapon_produced(weapon_name)
signal weapon_expired()



var material_on_hand = ['', '']

var global_player_ref = null
var global_mat_slots = []
var global_weapon_slot = null
var global_world_ref = null
var global_boss_ref = null


func _ready():
	item_picked.connect(on_item_picked)


func produce_weapon():
	if material_on_hand[0] != '' and material_on_hand[1] != '':
		pass
	else:
		return
	
	var w1 = material_on_hand[0]
	var w2 = material_on_hand[1]
	
	var weapon_suf = w1.to_pascal_case() + w2.to_pascal_case()
	
	var weapon = 'Weapon_%s' % weapon_suf
	
	global_player_ref.give_weapon(weapon)
#	weapon_produced.emit(weapon)
	
	
	material_on_hand[0] = ''
	material_on_hand[1] = ''
	
#	global_mat_slots[0].on_item_picked('')
#	global_mat_slots[1].on_item_picked('')
	


func on_item_picked(color: String):
	if material_on_hand[0] == '':
		material_on_hand[0] = color
		global_mat_slots[0].on_item_picked(color)
	elif material_on_hand[1] == '':
		material_on_hand[1] = color
		global_mat_slots[1].on_item_picked(color)
	
	if material_on_hand[0] != '' and material_on_hand[1] != '':
		material_on_hand[1] = material_on_hand[0]
		material_on_hand[0] = color
		
		global_mat_slots[0].on_item_picked(material_on_hand[0])
		global_mat_slots[1].on_item_picked(material_on_hand[1])
	
	
#	if material_on_hand[0] == '' or material_on_hand[1] == '':
#		return
	
#	if material_on_hand[0] != '' and material_on_hand[1] != '':
#		pass
#		produce_weapon()
	
