class_name RoomTransition extends InteractableComponent
@export var transition_to: String

func _ready() -> void:
	super._ready()
	interacted.connect(_on_interacted)

func _on_interacted() -> void:
	if not transition_to: return
	GameManager.change_map(transition_to)
