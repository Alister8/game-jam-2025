extends Node3D

@onready var cowboy_paths = get_children()

const COWBOY = preload("res://minigames/slide_game/Cowboy.tscn")
const TARGET = preload("res://minigames/slide_game/Target.tscn")

signal soda_served()

func create_cowboy():
	var path = cowboy_paths.pick_random()
	var cowboy = COWBOY.instantiate()
	cowboy.target = spawn_target(path.target_spawn)
	path.add_child(cowboy)

func spawn_target(spawn_point: Node3D):
	var target = TARGET.instantiate()
	add_child(target)
	target.global_position = spawn_point.global_position
	target.mug_recieved.connect(_on_mug_recieved)
	return target
	
func _on_mug_recieved():
	soda_served.emit()
