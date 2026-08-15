class_name DialogBubble extends Node3D

@onready var label: Label3D = $Label3D
@onready var animation: AnimationPlayer = $AnimationPlayer

signal dialogue_finised

var typing: bool = false
var done: bool = false

var text: String = ""
var letter_index: int = -1

var typing_speed: float = 0.05
var type_diff: float = 0.0

func _ready() -> void:
	typing = true

func _process(delta: float) -> void:
	if not typing: return
	
	type_diff -= delta
	
	if type_diff <= 0:
		type_diff = typing_speed
		add_letter(text[letter_index])
	
	if letter_index >= text.length():
		animation.play("disappear")
		await animation.animation_finished
		
		dialogue_finised.emit()
		queue_free()

func add_letter(letter: String) -> void:
	label.text += letter
	letter_index += 1
