extends Camera3D

@export var follow_speed = 0.1

func follow(anchor: Node3D):
	position = position.lerp(anchor.global_position, follow_speed)
	rotation = rotation.lerp(anchor.global_rotation, follow_speed)
