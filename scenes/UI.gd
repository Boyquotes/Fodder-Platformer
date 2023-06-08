extends Control

@onready var hp_bar = $HPBar
@onready var boss_hp_bar = $BossHPBar
@onready var ready_anim = $Control/ReadyAnim


func _ready():
	
	get_tree().paused = true
	
	ManagerGame.global_ui_ref = self
	
	ManagerGame.player_hit.connect(on_player_hit)
	ManagerGame.boss_hit.connect(on_boss_hit)
	
	ManagerGame.global_mat_slots.append($MaterialSlot)
	ManagerGame.global_mat_slots.append($MaterialSlot2)
	
	ready_anim.show()
	ready_anim.play("default")


func _physics_process(delta):
	if ManagerGame.material_on_hand[0] != '' and ManagerGame.material_on_hand[1] != '':
		$CraftLabel.show()
	else:
		$CraftLabel.hide()


func set_player_hp(min, max):
	hp_bar.max_value = max
	hp_bar.value = min


func set_boss_hp(min, max):
	boss_hp_bar.max_value = max
	boss_hp_bar.value = min


func on_player_hit():
	hp_bar.value = ManagerGame.global_player_ref.get_node('Hurtbox').hp


func on_boss_hit():
	boss_hp_bar.value = ManagerGame.global_boss_ref.get_node('Hurtbox').hp


func _on_ready_anim_animation_finished():
	ready_anim.hide()
	
	get_tree().paused = false
