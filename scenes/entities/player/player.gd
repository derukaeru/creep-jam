extends CharacterBody3D

@onready var model_container: Node3D = $model_container

const SPEED: float = 2
var can_move: bool = true

var movement_tw: Tween 

func _ready() -> void:
	EventBus.player_can_move.connect(
		func() -> void: 
			can_move = true
			velocity = Vector3.ZERO
	)
	EventBus.player_not_move.connect(func() -> void: can_move = false)

func _physics_process(_delta: float) -> void:
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if can_move:
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			
			if (movement_tw and not movement_tw.is_valid()) or not movement_tw:
				movement_tw = get_tree().create_tween()
				
				movement_tw.tween_property(model_container, "position:y", 0.2, 0.1)
				movement_tw.tween_property(model_container, "position:y", 0.0, 0.1)
				
				var look_direction = position + direction
				model_container.look_at(look_direction)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
