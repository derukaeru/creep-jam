class_name Player extends CharacterBody3D

@onready var model_container: Node3D = $model_container
@onready var interaction_area: Area3D = $interaction_area

@onready var camera_anchor: Node3D = $camera_anchor
@onready var camera: Camera3D = $camera_anchor/Camera3D

const gravity: float = 9.8
const SPEED: float = 10.5
var can_move: bool = true
var can_rotate: bool = false

var look_target: Vector3
var movement_tw: Tween 

var mails: Array = []

func _ready() -> void:
	EventBus.player_can_move.connect(
		func() -> void: 
			can_move = true
			velocity = Vector3.ZERO
	)
	EventBus.player_not_move.connect(
		func() -> void: 
			can_move = false
			velocity = Vector3.ZERO
	)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	var input_dir: Vector2 = Input.get_vector("left", "right", "forward", "backward")
	var direction: Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if can_move:
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			
			if (movement_tw and not movement_tw.is_valid()) or not movement_tw:
				movement_tw = get_tree().create_tween()
				
				movement_tw.tween_property(model_container, "position:y", 0.2, 0.13)
				movement_tw.parallel()
				movement_tw.tween_property(model_container, "scale:x", 0.9, 0.13)
				movement_tw.parallel()
				movement_tw.tween_property(model_container, "scale:y", 1.1, 0.13)
				
				movement_tw.tween_property(model_container, "position:y", 0.0, 0.1)
				movement_tw.parallel()
				movement_tw.tween_property(model_container, "scale:x", 1, 0.13)
				movement_tw.parallel()
				movement_tw.tween_property(model_container, "scale:y", 1, 0.13)
				
				look_target = Vector3(velocity.x, 0, velocity.z)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
	
	model_container.rotation.y = lerp_angle(model_container.rotation.y, atan2(-look_target.x, -look_target.z), .23)
	move_and_slide()

func _input(_event) -> void:
	if Input.is_action_just_pressed("interact"):
		interact()
	
	if can_rotate:
		var rotate_axis: float = Input.get_axis("ui_left", "ui_right")
		

func interact() -> void:
	var interactions = interaction_area.get_overlapping_areas().filter(
		func(a) -> bool: 
			return a is InteractableComponent
	)
	
	for entry in interactions:
		if entry.active:
			entry.interact()
