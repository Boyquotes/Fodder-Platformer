extends CharacterBody2D


var vel = Vector2.ZERO
var gravity = 70.0
var jump_force = 800.0
var move_speed = 200.0
var has_weapon = false


@onready var player_detect = $PlayerDetect
@onready var aim = get_node('%Aim')
@onready var anim = $AnimationPlayer
@onready var sprite = $Sprite2D


func _ready():
	ManagerGame.global_player_ref = self


func _process(delta):
	if Input.is_action_just_pressed("get"):
		if player_detect.get_overlapping_bodies().size() > 0:
			var item = player_detect.get_overlapping_bodies()[0]
			
			ManagerGame.item_picked.emit(item.color)
			
			item.queue_free()


func _physics_process(delta):
	if !is_on_floor():
		vel.y += gravity
	
	if is_on_floor() and Input.is_action_just_pressed('ui_up'):
		vel.y = -jump_force
	
	vel.x = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
	
	var look = global_position.direction_to(get_global_mouse_position())
	if look.x > 0.5:
		sprite.flip_h = false
	elif look.x < -0.5:
		sprite.flip_h = true
	
	if vel.x > 0.5:
		sprite.flip_h = false
	elif vel.x < -0.5:
		sprite.flip_h = true
	
	if has_weapon:
		if vel.x != 0.0:
			anim.play("run")
		else:
			anim.play("idle")
	else:
		if vel.x != 0.0:
			anim.play("run_h")
		else:
			anim.play("idle_h")
	
	velocity = Vector2(vel.x * move_speed, vel.y)
	
	move_and_slide()


func give_weapon(weapon_name: String):
	if ResourceLoader.exists("res://actors/weapons/%s.tscn" % weapon_name) == false:
		print_debug('weapon does not exists')
		return
	
	has_weapon = true
	
	# weapons will be found as long as you follow the following format:
	# Weapon_RedRed is a result of a red first slot material with a red secondary slot material
	# if the player for example acquired Blue and then Green the weapon_name
	# will be Weapon_BlueGreen, this string will be used to get the path of the weapon's scene
	
	var w = load("res://actors/weapons/%s.tscn" % weapon_name).instantiate()
	
	aim.add_child(w)


func remove_weapon():
	has_weapon = false
	
	aim.get_child(0).queue_free()



