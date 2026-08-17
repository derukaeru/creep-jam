class_name SettingsScreen extends Control
@onready var animation: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	pass

func exit_pressed() -> void:
	animation.play_backwards("open")
	await animation.animation_finished
	hide()

func open() -> void:
	show()
	animation.play("open")
