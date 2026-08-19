extends Node

@onready var dialogue_bubble: PackedScene = load(Registry.UID.dialogue_bubble)

func say(id: String, paragraph_id: String, line_id: int, position: Vector3) -> DialogBubble:
	if not Dialogues.dialogue.has(paragraph_id):
		return
	if line_id < 0:
		line_id = randi() % Dialogues.dialogue[id].length()
	
	var bubble: DialogBubble = dialogue_bubble.instantiate()
	bubble.text = Dialogues.dialogue[id][line_id]
	
	
	bubble.typing = true
	
	bubble.global_position = position
	EventBus.add_entities.emit(bubble)
	
	return bubble
