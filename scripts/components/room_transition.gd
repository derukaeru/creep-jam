class_name RoomTransition extends InteractableComponent

@export var transition_to: String

func _on_interacted() -> void:
	if not transition_to or not Registry.MAPS.has(transition_to): return
	EventBus.go_to_map.emit(transition_to)
