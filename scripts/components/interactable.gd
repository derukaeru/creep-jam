class_name InteractableComponent extends Area3D

signal interacted

func _ready() -> void:
	pass

func interact() -> void:
	interacted.emit()
