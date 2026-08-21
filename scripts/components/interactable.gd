class_name InteractableComponent extends Area3D
signal interacted

@onready var interact_bubble: InteractBubble
@export var active: bool = true
@export var interact_text: String

func _ready() -> void:
	if interact_text.length() > 0:
		interact_bubble = load(Registry.UID.interact_bubble).instantiate()
		interact_bubble.text = interact_text
		
		add_child(interact_bubble)
		
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

func interact() -> void:
	if active:
		interacted.emit()
