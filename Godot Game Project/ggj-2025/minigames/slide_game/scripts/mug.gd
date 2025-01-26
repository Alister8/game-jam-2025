extends RigidBody3D

@export var cam_anchor: Marker3D
const BUBBLE_PARTICLES = preload("res://minigames/slide_game/assets/BubbleParticles.tscn")

func bubble_vanish():
	var instance = BUBBLE_PARTICLES.instantiate()
	get_tree().get_root().add_child(instance)
	instance.position = global_position
	instance.top_level = true
	queue_free()
