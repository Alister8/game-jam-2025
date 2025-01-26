extends PathFollow3D

enum State {ARRIVING, SITTING, LEAVING}
var current_state = State.ARRIVING
var target
var move_speed = 0.5

@onready var sprite = $AnimatedSprite3D

func _set_state(state):
	#if state == State.SITTING:
		#pass
	current_state = state

func _physics_process(delta):
	if !target:
		_set_state(State.LEAVING)
	match current_state:
		State.ARRIVING:
			sprite.frame = 0
			progress_ratio += move_speed * delta
			if progress_ratio == 1:
				_set_state(State.SITTING)
		State.SITTING:
			sprite.frame = 1
		State.LEAVING:
			sprite.frame = 0
			progress_ratio -= move_speed * delta
			if progress_ratio == 0:
				queue_free()
