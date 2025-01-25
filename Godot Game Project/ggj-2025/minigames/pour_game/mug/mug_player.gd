extends CharacterBody2D

var move_dir: Vector2 
var walk_vel:Vector2
var tilt: float = 0
var speed: float = 10000
var acceleration: float = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta: float) -> void:
	velocity = _walk(delta)
	rotation = _tilt(delta)
	move_and_slide()


func _walk(delta: float) -> Vector2:
	walk_vel = Input.get_vector("left", "right", "up", "down") * speed * delta
	return walk_vel
	

func _tilt(delta: float) -> float:
	tilt += Input.get_action_strength("tilt_right") * delta - Input.get_action_strength("tilt_left") * delta
	return tilt
