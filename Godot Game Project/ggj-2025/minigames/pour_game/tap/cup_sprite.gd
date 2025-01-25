extends Sprite2D


@export var mug: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = mug.global_position
	rotation = mug.global_rotation
	pass
