extends Node3D

@onready var world_env: WorldEnvironment = $WorldEnvironment
@onready var map_container: Node3D = $map_container

var old_map_id: String
var map_id: String

func _ready() -> void:
	EventBus.go_to_map.connect(go_to_map)
	EventBus.set_camera.connect(set_camera)
	
	EventBus.change_env_background_color.connect(change_background_color)
	EventBus.change_env_fog_color.connect(change_fog_color)
	EventBus.change_env_fog_density.connect(change_fog_density)

func go_to_map(id: String) -> void:
	EventBus.player_not_move.emit()
	
	GameManager.ui.room_transition_anim.play("transition")
	transition_zoom_camera()
	await GameManager.ui.room_transition_anim.animation_finished
	
	old_map_id = map_id
	
	for map in map_container.get_children():
		map.queue_free()
	
	var new_map: Node3D = load(Registry.MAPS[id]).instantiate()
	map_container.add_child(new_map)
	
	map_id = id
	EventBus.changed_map.emit(old_map_id, map_id)
	
	GameManager.ui.room_transition_anim.play_backwards("transition")
	await GameManager.ui.room_transition_anim.animation_finished
	EventBus.player_can_move.emit()
	
func set_camera(camera: Camera3D) -> void:
	if not camera:
		print("there is no camera attached")
		return
	
	var current_camera: Camera3D = get_viewport().get_camera_3d()
	if current_camera:
		current_camera.current = false
	
	camera.current = true

func transition_zoom_camera() -> void:
	var current_camera: Camera3D = get_viewport().get_camera_3d()
	if not current_camera:
		return print("theres no current camera")
	
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(current_camera, "fov", 35, 0.72)
	
	await tw.finished
	current_camera.fov = GameManager.normal_fov

func change_fog_density(value: float) -> void:
	world_env.environment.fog_density = value

func change_background_color(color: Color) -> void:
	world_env.environment.background_color = color

func change_fog_color(color: Color) -> void:
	world_env.environment.fog_light_color = color
