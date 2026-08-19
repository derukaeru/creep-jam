class_name TitleScreen extends Control
@onready var settings_screen: SettingsScreen = $settings_screen

func _ready() -> void:
	GameManager.ui.hide()

func start_pressed() -> void:
	SceneChanger.change_scene("main")

func settings_pressed() -> void:
	settings_screen.open()

func mouse_entered(source: Button) -> void:
	source.text = "> " + source.text + " <" if not source.text.begins_with("> ") else source.text

func mouse_exited(source: Button) -> void:
	source.text = source.text.trim_prefix("> ").trim_suffix(" <")
