extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	top_level = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	var pour = get_overlapping_bodies()
	var pour_size = pour.size()
	get_tree().reload_current_scene()
	for i in pour:
		i.queue_free()
	print(pour_size)
