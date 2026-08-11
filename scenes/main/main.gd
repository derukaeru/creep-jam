extends Node3D

@onready var map_container: Node3D = $map_container

var old_map_id: String
var map_id: String

func _ready() -> void:
	EventBus.go_to_map.connect(go_to_map)

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
	
