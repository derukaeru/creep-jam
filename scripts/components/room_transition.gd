class_name RoomTransition extends InteractableComponent

@onready var interact_bubble: InteractBubble = load(Registry.UID.interact_bubble).instantiate()

@export var transition_to: String
@export var interact_text: String

func _ready() -> void:
	interacted.connect(_on_interacted)
	
	add_child(interact_bubble)
	interact_bubble.label.text = interact_text
	interact_bubble.hide()
	
	body_entered.connect(
		func(body) -> void: 
			if body is Player:
				interact_bubble.show()
	)
	body_exited.connect(
		func(body) -> void:
			if body is Player:
				interact_bubble.hide()
	)

func _on_interacted() -> void:
	if not transition_to: return
	GameManager.change_map(transition_to)
