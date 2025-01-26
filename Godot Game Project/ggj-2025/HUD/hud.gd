extends Control

const TAP_SCENE = preload("res://minigames/pour_game/tap/Tap.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _reset():
	$tap_game.free()
	var new_tap = TAP_SCENE.instantiate()
	#Must have unique nodepath
	#Might be done automatically, but just in case
	add_child(new_tap)
