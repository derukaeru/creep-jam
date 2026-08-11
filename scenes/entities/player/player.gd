extends CharacterBody3D

const SPEED: float = 5.0
var can_move: bool = true

func _ready() -> void:
	EventBus.player_can_move.connect(
		func() -> void: 
			can_move = true
			velocity = Vector3.ZERO
	)
	EventBus.player_not_move.connect(func() -> void: can_move = false)

func _physics_process(_delta) -> void:
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if can_move:
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
