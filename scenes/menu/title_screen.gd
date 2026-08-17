class_name TitleScreen extends Control
@onready var settings_screen: SettingsScreen = $settings_screen

func start_pressed() -> void:
	SceneChanger.change_scene("main")

func settings_pressed() -> void:
	settings_screen.open()
