extends Area3D

signal mug_recieved

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if has_overlapping_bodies():
		for body in get_overlapping_bodies():
			if body.is_in_group("mug"):
				if body.linear_velocity == Vector3.ZERO:
					mug_recieved.emit()
					queue_free()
	rotation.y += 1 * delta
