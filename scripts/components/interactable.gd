class_name InteractableComponent extends Area3D
signal interacted

@export var active: bool = true

func _ready() -> void:
	pass

func interact() -> void:
	if active:
		interacted.emit()
