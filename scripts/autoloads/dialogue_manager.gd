extends Node

@onready var dialogue_bubble: PackedScene = load(Registry.UID.dialogue_bubble)

func say(text: String, position: Vector3) -> void:
	var bubble: DialogBubble = dialogue_bubble.instantiate()
	bubble.text = text
	bubble.typing = true
	
	bubble.global_position = position
	
	EventBus.add_entities.emit(bubble)
