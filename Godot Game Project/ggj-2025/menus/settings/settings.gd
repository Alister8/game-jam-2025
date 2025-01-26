extends Control


func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value /4)
	
	pass # Replace with function body.


func _on_back_pressed():
	get_tree().change_scene_to_file("res://menus/main_menu/main_menu.tscn")
	pass # Replace with function body.


func _on_fullscreen_toggled(toggled_on):
	if $CenterContainer/VBoxContainer/Fullscreen.button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) 
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	pass # Replace with function body.


func _on_volume_drag_started():
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_volume_drag_ended(value_changed):
	$AudioStreamPlayer.stop()
	pass # Replace with function body.
