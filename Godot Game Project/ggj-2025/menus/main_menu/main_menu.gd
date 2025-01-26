extends Control

@export var game_scene: String
@export var settings_scene: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://minigames/slide_game/Main.tscn")
	pass # Replace with function body.


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://menus/settings/Settings.tscn")
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
