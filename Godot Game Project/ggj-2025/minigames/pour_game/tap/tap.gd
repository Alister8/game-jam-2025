extends Node2D

@export var drop_scene_path: String
@export var mug: NodePath

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("action_1"):
		var drop_scene = load(drop_scene_path)
		var new_drop = drop_scene.instantiate()
		new_drop.position = position
		get_parent().add_child(new_drop)
	pass
