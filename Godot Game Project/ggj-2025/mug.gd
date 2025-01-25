extends CharacterBody2D

var move_dir: Vector2 
var walk_vel:Vector2
var speed: float = 10
var acceleration: float = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta: float) -> void:
	velocity = _walk(delta)
	move_and_slide()


func _walk(delta: float) -> Vector2:
	move_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backwards")
	var walk_dir: Vector2 = Vector2(0, 0)
	walk_vel = walk_vel.move_toward(walk_dir * speed * move_dir.length(), acceleration * delta)
	return walk_vel
