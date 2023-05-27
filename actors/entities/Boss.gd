extends Node2D


enum STATE{
	MOVING,
	ATTACKING
}


@onready var path = get_parent()
@onready var anim = $Anim
@onready var hand_anim = $HandAnim

var state = STATE.MOVING

var weapons_list = [
	"res://actors/weapons/boss_attacks/Boss_Weapon_SkullBurst.tscn",
	"res://actors/weapons/boss_attacks/Boss_Weapon_Sword.tscn",
]


func _physics_process(delta):
	if state == STATE.MOVING:
		path.progress_ratio += delta * .07
		
		if path.progress_ratio >= 1.0:
			path.progress_ratio = 0.0
	elif state == STATE.ATTACKING:
		attack()


func attack():
	anim.play("attack_1")
	hand_anim.play("attack_1")
	
	var rand = randi() % weapons_list.size()
	var w = load(weapons_list[0]).instantiate()
	
	add_child(w)
	
	state = STATE.MOVING


func _on_state_timer_timeout():
	var rand = randi() % STATE.keys().size()
	
	state = STATE.values()[rand]
