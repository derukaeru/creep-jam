class_name RoomTransition extends InteractableComponent

@export var transition_to: String

func _ready() -> void:
	interacted.connect(_on_interacted)

func _on_interacted() -> void:
	if not transition_to: return
	if not Registry.MAPS.has(transition_to):
		return print("Registry.MAPS has no record of:" + transition_to)
	EventBus.go_to_map.emit(transition_to) 
