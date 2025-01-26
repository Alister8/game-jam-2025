extends RigidBody3D

@export var cam_anchor: Marker3D
const BUBBLE_PARTICLES = preload("res://minigames/slide_game/assets/BubbleParticles.tscn")
@onready var sliding_sfx = $SlidingSFX
@onready var slide_cast = $SlideCast

func bubble_vanish():
	var instance = BUBBLE_PARTICLES.instantiate()
	get_tree().get_root().add_child(instance)
	instance.position = global_position
	instance.top_level = true
	queue_free()

func _physics_process(delta):
	if abs(linear_velocity.x) > 0.05 and abs(linear_velocity.z) > 0.05 and slide_cast.is_colliding():
		if sliding_sfx.playing == false:
			sliding_sfx.playing = true
