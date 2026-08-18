class_name StaticNPC extends StaticBody3D
@onready var animation: AnimationPlayer = $AnimationPlayer
@export var ID: String = ""

var dialogue_bubble: DialogBubble
var talking: bool = false
var talking_dialogue: bool = false

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func talk_interacted() -> void:
	dialogue_bubble = DialogueManager.say("idk", position)
	talking = true
