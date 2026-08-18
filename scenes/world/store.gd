extends Node3D

@onready var camera_pivot: Marker3D = $camera_pivot

func _ready() -> void:
	EventBus.set_camera.emit(camera_pivot)
	EventBus.changed_map.connect(changed_map)

func changed_map(from: String, _to: String) -> void:
	var player: Player = Util.get_player()
	if not player: return
	
	match from:
		"main_outside":
			player.global_position = $entrance.global_position
