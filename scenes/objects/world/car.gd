class_name Car extends VehicleBody3D

@onready var model_container: Node3D = $model_container
@onready var leave_marker: Marker3D = $leave_marker
@onready var player_seat: Marker3D = $player_seat

var max_steer: float = 0.4
var speed: float = 620

var player_in: bool = false
var is_leaving: bool = false
var deceleration: float = 15.0

func _ready() -> void:
	freeze = true
	freeze_mode = RigidBody3D.FREEZE_MODE_STATIC
	center_of_mass_mode = RigidBody3D.CENTER_OF_MASS_MODE_CUSTOM
	center_of_mass = Vector3(0.0, -0.7, 0.0)

func _physics_process(delta: float) -> void:
	if is_leaving:
		linear_velocity = linear_velocity.move_toward(Vector3.ZERO, deceleration * delta)
		angular_velocity = angular_velocity.move_toward(Vector3.ZERO, deceleration * delta)
		
		if linear_velocity.length() < 0.05 and angular_velocity.length() < 0.05:
			is_leaving = false
			freeze = true
	
	if not player_in: return
	
	var player: Player = Util.get_player()
	if not player: return
	
	player.global_position = player_seat.global_position
	player.target_rotation = rotation.y
	
	steering = move_toward(steering, Input.get_axis("right", "left") * max_steer, delta * 10)
	
	var acceleration_inp: float = Input.get_axis("backward", "forward")
	if acceleration_inp == 0:
		brake = 0.5
		engine_force = 0.0
	else:
		brake = 0.0
		engine_force = acceleration_inp * speed

func interacted() -> void:
	var player: Player = Util.get_player()
	if not player: return
	
	if player_in: 
		player.show()
		player.can_move = true
		player.is_in_car = false
		player.global_position = global_position + Vector3(2.0, 1.0, 0.0)
		player.collision.set_deferred("disabled", false)
		player.camera.fov = 100.0
		
		player_in = false
		is_leaving = true
		
		brake = 1.0
		engine_force = 0.0
		steering = 0.0
	else:
		player.hide()
		player.can_move = false
		player.is_in_car = true
		player.target_rotation = 0.0
		player.collision.set_deferred("disabled", true)
		player.camera.fov = 80.0
		
		player_in = true
		freeze = false
		is_leaving = false
		
		steering = 0.0
		brake = 0.0
		engine_force = 0.0
	
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(model_container, "scale:x", 0.9, 0.1)
	tw.parallel()
	tw.tween_property(model_container, "scale:y", 1.1, 0.1)
	
	tw.tween_property(model_container, "scale:x", 1.0, 0.1)
	tw.parallel()
	tw.tween_property(model_container, "scale:y", 1.0, 0.1)
