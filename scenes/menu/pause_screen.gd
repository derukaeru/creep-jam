class_name PauseScreen extends Control

func _on_resume_pressed() -> void:
	get_tree().paused = false
	hide()

func _on_settings_pressed() -> void:
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	SceneChanger.change_scene("title_screen")
