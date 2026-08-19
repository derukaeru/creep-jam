extends CharacterBody3D
@onready var animation: AnimationPlayer = $AnimationPlayer

@export var NAME: String = ""
@export var paragraph_id: String = ""
@export var line_id: int = -1
@export var can_talk: bool = true

var dialogue_bubble: DialogBubble
var talking: bool = false
var talking_paragraph: bool = false

func talk_interact() -> void:
	if can_talk:
		dialogue_bubble = DialogueManager.say(NAME, paragraph_id, line_id, global_position + Vector3(0.0, 1.5, 0.0))
		talking = true
