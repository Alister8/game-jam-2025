extends Node2D

var foam_level: float = 30

# Called when the node enters the scene t      ree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Global.mug_position = $Node2D.position
	pass


func _physics_process(delta: float) -> void:
	pass
