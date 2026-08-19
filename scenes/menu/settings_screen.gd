class_name SettingsScreen extends Control
@onready var animation: AnimationPlayer = $AnimationPlayer

@onready var sound_effect_slider: HSlider = $sound_effect_slider
@onready var music_slider: HSlider = $music_slider

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

func sfx_value_changed(value: bool) -> void:
	SettingsManager.set_sfx(value)

func music_value_changed(value: bool) -> void:
	SettingsManager.set_music(value)

func fullscreen_toggled(toggled_on: bool) -> void:
	SettingsManager.set_fullscreen(toggled_on)
