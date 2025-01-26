extends Node3D

@onready var arrow_animation_player = $Arrow/AnimationPlayer
@onready var arrow = $Arrow

@onready var camera = $Camera
var mug_cam_anchor
@onready var cam_anchor_1 = $CamAnchor1
@onready var cam_anchor_3 = $WinArea/CamAnchor3

@onready var power_bar = $UI/PowerBar

@onready var win_area = $WinArea

@onready var mug_spawn = $MugSpawn
const MUG = preload("res://minigames/slide_game/Mug.tscn")
var current_mug

var launch_direction
var launch_power = 0
var speed_modifier = 0.75

enum State {POWER, AIM, FOLLOW, SUCCESS, FAILURE}
var current_state

func _ready():
	arrow_animation_player.speed_scale = speed_modifier
	spawn_mug()
	current_state = State.POWER

func _physics_process(delta): 
	match current_state:
		State.POWER:
			camera.follow(cam_anchor_1)
			power_bar.show()
			power_bar.value = launch_power
			launch_power = 15 * (1 + sin(Time.get_ticks_msec() * (0.005 * speed_modifier)))
			if Input.is_action_just_pressed("action_1"):
				arrow.show()  
				current_state = State.AIM
		State.AIM:
			arrow.show()
			launch_direction = arrow.get_global_transform().basis.z
			if Input.is_action_just_pressed("action_1"):  
				current_mug.apply_central_impulse(-launch_direction * launch_power)
				arrow.hide()
				power_bar.hide()  
				current_state = State.FOLLOW
		State.FOLLOW: 
			if win_area.has_overlapping_bodies():
				for body in win_area.get_overlapping_bodies():
					if body.is_in_group("mug"):
						camera.follow(cam_anchor_3)
						if body.linear_velocity == Vector3.ZERO:
							current_state = State.SUCCESS
			else:
				camera.follow(mug_cam_anchor)
				if current_mug.linear_velocity == Vector3.ZERO:
					current_state = State.FAILURE
			if current_mug.global_position.y < 0:
				current_state = State.FAILURE
		State.SUCCESS: 
			print("you did it!")
			current_mug.bubble_vanish()
			spawn_mug()
		State.FAILURE: 
			print("you suck!")
			current_mug.bubble_vanish()
			spawn_mug()
			
			
func spawn_mug():
	current_mug = MUG.instantiate()
	add_child(current_mug)
	current_mug.position = mug_spawn.position
	mug_cam_anchor = current_mug.cam_anchor
	current_state = State.POWER
