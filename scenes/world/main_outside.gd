extends Node3D

@onready var camera: Camera3D = $Camera3D
@onready var spawns_container: Node3D = $spawns

var spawns: Dictionary = {}

func _ready() -> void:
	EventBus.set_camera.emit(camera)
	EventBus.changed_map.connect(changed_map)

func _process(_delta: float) -> void:
	var player: Player = Util.get_player()
	if not player: return
	
	camera.global_position = player.global_position + Vector3(0.0, 3.7, 3.6)

func changed_map(prev: String, _new: String) -> void:
	var player: Player = Util.get_player()
	if not player: return
	
	match prev:
		"room":
			player.global_position = $spawns/first_room.global_position
