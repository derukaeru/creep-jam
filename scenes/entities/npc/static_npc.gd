class_name StaticNPC extends StaticBody3D
@onready var animation: AnimationPlayer = $AnimationPlayer

@export var NAME: String = ""
@export var dialogue_paragraph: String = ""
@export var dialogue_line: int = -1

var dialogue_bubble: DialogBubble
var talking: bool = false
var talking_dialogue: bool = false

func talk_interacted() -> void:
	dialogue_bubble = DialogueManager.say(NAME, dialogue_paragraph, dialogue_line, position)
	talking = true
