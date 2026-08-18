class_name PauseScreen extends Control

@onready var settings_screen: SettingsScreen = $settings_screen
@onready var animation: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	hide()

func _on_resume_pressed() -> void:
	close()

func _on_settings_pressed() -> void:
	settings_screen.open()

func _on_exit_pressed() -> void:
	SceneChanger.change_scene("title_screen")

func open() -> void:
	show()
	animation.play("open")

func close() -> void:
	animation.play_backwards("open")
	await animation.animation_finished
	hide()
	get_tree().paused = false

func mouse_entered(source: Button) -> void:
	source.text = "> " + source.text + " <" if not source.text.begins_with("> ") else source.text

func mouse_exited(source: Button) -> void:
	source.text = source.text.trim_prefix("> ").trim_suffix(" <")
