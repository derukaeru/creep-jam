extends Node3D

@onready var camera: Camera3D = $Camera3D

func _ready() -> void:
	EventBus.set_camera.emit(camera)

func _process(_delta: float) -> void:
	var player: Player = Util.get_player()
	if not player: return
	
	camera.global_position = player.global_position + Vector3(0.0, 4.3, 3.6)
