extends Node3D

@onready var mug = $Mug

@onready var arrow_animation_player = $Arrow/AnimationPlayer
@onready var arrow = $Arrow

@onready var camera = $Camera
@onready var cam_anchor_2 = $Mug/CamAnchor2
@onready var cam_anchor_1 = $CamAnchor1
@onready var cam_anchor_3 = $WinArea/CamAnchor3

@onready var power_bar = $UI/PowerBar

@onready var win_area = $WinArea

var launch_direction
var launch_power = 0
var speed_modifier = 0.75

enum State {POWER, AIM, FOLLOW, SUCCESS, FAILURE}
var current_state = State.POWER


func _ready():
	arrow_animation_player.speed_scale = speed_modifier

func _physics_process(delta): 
	match current_state:
		State.POWER:
			power_bar.show()
			power_bar.value = launch_power
			launch_power = 15  * (1 + sin(Time.get_ticks_msec() * (0.005 * speed_modifier)))
			if Input.is_action_just_pressed("action_1"):
				arrow.show()  
				current_state = State.AIM
		State.AIM:
			arrow.show()
			launch_direction = arrow.get_global_transform().basis.z
			camera.position = cam_anchor_1.position
			camera.rotation = cam_anchor_1.rotation
			
			if Input.is_action_just_pressed("action_1"):  
				mug.apply_central_impulse(-launch_direction * launch_power)
				arrow.hide()
				power_bar.hide()  
				current_state = State.FOLLOW
		State.FOLLOW: 
			if win_area.has_overlapping_bodies():
				for body in win_area.get_overlapping_bodies():
					if body.is_in_group("mug"):
						camera.position = camera.position.lerp(cam_anchor_3.global_position, 0.1)
						camera.rotation = camera.rotation.lerp(cam_anchor_3.global_rotation, 0.1)
						if body.linear_velocity == Vector3.ZERO:
							current_state = State.SUCCESS
			else:
				camera.position = camera.position.lerp(cam_anchor_2.global_position, 0.1)
				camera.rotation = camera.rotation.lerp(cam_anchor_2.global_rotation, 0.1)
				if mug.linear_velocity == Vector3.ZERO:
					current_state = State.FAILURE
			if mug.global_position.y < 0:
				current_state = State.FAILURE
		State.SUCCESS: 
			print("you did it!")
		State.FAILURE: 
			print("you suck!")
