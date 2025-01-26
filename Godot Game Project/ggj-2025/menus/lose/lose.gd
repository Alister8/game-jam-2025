extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/VBoxContainer/HBoxContainer/CashCount. text = var_to_str(Global.cash)
	Global.cash = 0
	pass # Replace with function body.

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://menus/main_menu/main_menu.tscn")
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
