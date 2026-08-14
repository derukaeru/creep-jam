extends Node3D

@onready var camera: Camera3D = $Camera3D

func _ready() -> void:
	EventBus.set_camera.emit(camera)
