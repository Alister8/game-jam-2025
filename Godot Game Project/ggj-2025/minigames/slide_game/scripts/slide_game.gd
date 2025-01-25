extends Node3D

@onready var mug = $Mug

@onready var arrow_animation_player = $Arrow/AnimationPlayer
@onready var arrow = $Arrow

@onready var camera = $Camera
@onready var cam_anchor_2 = $Mug/CamAnchor2
@onready var cam_anchor_1 = $CamAnchor1

@onready var power_bar = $UI/PowerBar

var launch_direction
var launch_power = 0
var speed_modifier = 1

enum State {AIM, POWER, FOLLOW}
var current_state = State.AIM


func _ready():
	arrow_animation_player.speed_scale = speed_modifier

func _physics_process(delta): 
	arrow_animation_player.speed_scale = speed_modifier
	match current_state:
		State.AIM:
			launch_direction = arrow.get_global_transform().basis.z
			camera.position = cam_anchor_1.position
			camera.rotation = cam_anchor_1.rotation
			
			if Input.is_action_just_pressed("action_1"):
				arrow_animation_player.pause()     
				current_state = State.POWER
				power_bar.show()
		State.POWER:
			power_bar.value = launch_power
			launch_power = 15  * (1 + sin(Time.get_ticks_msec() * 0.005))
			if Input.is_action_just_pressed("action_1"):
				mug.apply_central_impulse(-launch_direction * launch_power)
				arrow.hide()  
				power_bar.hide()  
				current_state = State.FOLLOW
		State.FOLLOW:
			camera.position = camera.position.lerp(cam_anchor_2.global_position, 0.1)
			camera.rotation = camera.rotation.lerp(cam_anchor_2.global_rotation, 0.1)

			
