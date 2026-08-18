extends Node3D

@onready var camera_pivot_1: Marker3D = $main_camera_pivot_1

func _ready() -> void:
	EventBus.set_camera.emit(camera_pivot_1, Vector3.ZERO, true)
