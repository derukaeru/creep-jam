extends CharacterBody3D
@onready var animation: AnimationPlayer = $AnimationPlayer
@export var ID: String = ""

var dialogue_bubble: DialogBubble
var talking: bool = false
var talking_paragraph: bool = false

func talk_interact() -> void:
	dialogue_bubble = DialogueManager.say(ID, global_position + Vector3(0.0, 1.5, 0.0))
	talking = true
