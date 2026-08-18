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

func mouse_entered(source: Button) -> void:
	source.text = "> " + source.text + " <" if not source.text.begins_with("> ") else source.text

func mouse_exited(source: Button) -> void:
	source.text = source.text.trim_prefix("> ").trim_suffix(" <")
