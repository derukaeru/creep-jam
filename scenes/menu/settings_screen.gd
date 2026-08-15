class_name SettingsScreen extends Control
@onready var animation: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	pass

func exit_pressed() -> void:
	animation.play_backwards("open")
	hide()
