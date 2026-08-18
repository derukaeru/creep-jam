extends Node3D

@onready var camera_pivot_1: Marker3D = $main_camera_pivot_1
@onready var spawns_container: Node3D = $spawns

var spawns: Dictionary = {}

func _ready() -> void:
	EventBus.set_camera.emit(camera_pivot_1, Vector3.ZERO, false)
	EventBus.changed_map.connect(changed_map)

func changed_map(prev: String, _new: String) -> void:
	var player: Player = Util.get_player()
	if not player: return
	
	match prev:
		"room":
			player.global_position = $spawns/first_room.global_position
