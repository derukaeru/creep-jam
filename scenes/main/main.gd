extends Node3D

@onready var map_container: Node3D = $map_container

var old_map_id: String
var map_id: String

func _ready() -> void:
	EventBus.go_to_map.connect(go_to_map)
	EventBus.set_camera.connect(set_camera)

func go_to_map(id: String) -> void:
	EventBus.player_not_move.emit()
	
	# transition here first 
	# wait for transition to end
	
	old_map_id = map_id
	
	for map in map_container.get_children():
		map.queue_free()
	
	var new_map: Node3D = load(Registry.MAPS[id]).instantiate()
	map_container.add_child(new_map)
	
	map_id = id
	EventBus.changed_map.emit(old_map_id, map_id)
	EventBus.player_can_move.emit()
	
func set_camera(camera: Camera3D) -> void:
	if not camera:
		print("there is no camera attached")
		return
	
	var current_camera: Camera3D = get_tree().get_first_node_in_group("main_camera")
	if current_camera: 
		current_camera.remove_from_group("main_camera")
	
	camera.add_to_group("main_camera")
